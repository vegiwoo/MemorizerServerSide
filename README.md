# MemorizerServerSide
Проект для разработки серверной части сервиса для обучения и интервального повторения учебных материалов 

<a name="Content"></a>
1. [Запуск приложения](Application_launch)
2. [Полезные ресурсы](Useful_Resources)

[В начало](Content)
# Запуск приложения <a name="Application_launch"></a> 
При запуске приложения оно ожидает следующие переменные окружения: 
|Имя переменной|Назначение|Пояснение|
|:------|:-----|:------|
|`MEMORIZER_JWKS_KEY`|Набор веб-ключей JWKS для сервера|Сформирован на [mkjwk.org](https://mkjwk.org), определен в файле `keypair.jwks` и лежит в корне рабочего проекта (на github не предоставляется)|

Подробнее о работе с переменными окружения в Vapor - [Environment](https://docs.vapor.codes/4.0/environment/)

---
[В начало](Content)
# Полезные ресурсы <a name="Useful_Resources"></a> 
- [Sharing Swift Code Between iOS and Server Applications](https://www.raywenderlich.com/20029037-sharing-swift-code-between-ios-and-server-applications)
