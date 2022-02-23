import Vapor
import Fluent
import FluentPostgresDriver
import JWT

public func configure(_ app: Application) throws {
    
    // MARK: Server config
    // Use custom port
    // app.http.server.configuration.port = [PORT_NUMBER]
    
    // MARK: Middlewares
    app.middleware.use(CORSMiddleware());
    app.middleware.use(ErrorMiddleware.default(environment: .development))
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // MARK: JWT config
    // Request from environment and register a JWKS key to start server
    guard let jwrsString = Environment.process.JWKS else {
        app.logger.critical("JWKS key not provided to start server"); fatalError()
    }
    try app.jwt.signers.use(jwksJSON: jwrsString)
    
    // MARK: DB config
    /*
     * To register test and prod DB, server at startup expects PSQL_TEST and
     * PSQL_PROD type strings:
     * 'postgres://ar_collab_db_user:UnbXtxfM88nuEhbvLk0L@127.0.0.1:5432/service_users'
     */
    var psqlUrl : String = ""
    if app.environment.name == "testing" {
        guard let url = Environment.process.PSQL_TEST else {
            let error = "No value for key 'PSQL_TEST' was found in environment"
            throw Abort (HTTPResponseStatus.internalServerError, reason: error)
        }
        psqlUrl = url
        
    } else {
        guard let url = Environment.process.PSQL_PROD else {
            let error = "No value for key 'PSQL_PROD' was found in environment."
            app.logger.critical("\(error)")
            throw Abort (HTTPResponseStatus.internalServerError, reason: error)
        }
        psqlUrl = url
    }
    
    // Check if string is valid and register DB
    guard let url = URL(string: psqlUrl) else {
        let error = "Can`t parse correctly \(psqlUrl)."
        app.logger.critical("\(error)")
        throw Abort (HTTPResponseStatus.internalServerError, reason: error)
      }
    app.databases.use(try .postgres(url: url), as: .psql)

    // Add migrations in DB
//    if app.environment.name == "testing" {
//        app.migrations.add(CreateUserAccessRights())
//        try app.autoMigrate().wait()
//        app.logger.notice("Migration complete.")
//    } else {
//        app.migrations.add(CreateUserAccessRights())
//        try app.autoMigrate().wait()
//        app.logger.notice("Migration complete.")
//    }
    
    // MARK: Register routes
    try routes(app)
}
