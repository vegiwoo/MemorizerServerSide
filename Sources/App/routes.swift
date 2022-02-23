import Fluent
import Vapor

func routes(_ app: Application) throws {

    app.get("ping") { req -> String in
        return "pong"
    }
}
