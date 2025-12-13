第一次改起時將/src/main/resources/application.properties最後一行spring.sql.init.mode=never改成spring.sql.init.mode=always。之後若要重啟後端，要先把spring.sql.init.mode=always改成spring.sql.init.mode=never
