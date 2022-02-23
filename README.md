# MemorizerServerSide
Проект для разработки серверной части сервиса для обучения и интервального повторения учебных материалов 

# Запуск приложения 
При запуске приложения оно ожидает следующие переменные окружения: 
|Имя переменной|Назначение|Пояснение|
|:------|:-----|:------|
|`MEMORIZER_JWKS_KEY`|Набор веб-ключей JWKS для сервера|Сформирован на [mkjwk.org](https://mkjwk.org), определен в файле `keypair.jwks` и лежит в корне рабочего проекта (на github не предоставляется)|

Подробнее о работе с переменными окружения в Vapor - [Environment](https://docs.vapor.codes/4.0/environment/)
