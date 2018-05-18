dataSource {
/**
    CREATE DATABASE dbip17rem DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
	USE dbip17rem;
	CREATE USER 'usdbip17rem'@'localhost' IDENTIFIED BY 'y7gdol3y]dio';
	GRANT USAGE ON * . * TO 'usdbip17rem'@'localhost' IDENTIFIED BY 'y7gdol3y]dio' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
	GRANT ALL PRIVILEGES ON dbip17rem.* TO 'usdbip17rem'@'localhost';
 */
//    pooled = true
//    jmxExport = true
//    driverClassName = "org.h2.Driver"
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    username = "usdbip17rem"
    password = "y7gdol3y]dio"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
		    url = "jdbc:mysql://localhost:3306/dbip17rem?characterEncoding=utf8"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
		    url = "jdbc:mysql://localhost:3306/dbip17rem?characterEncoding=utf8"
        }
    }
    production {
        dataSource {

		    //pooled = true
		    dbCreate = "update"
		    url = "jdbc:mysql://localhost:3306/dbip17rem?characterEncoding=utf8"
		    driverClassName = "com.mysql.jdbc.Driver"
		    username = "usdbip17rem"
		    password = "y7gdol3y]dio"
		    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
		    properties {
		       jmxEnabled = true
		       initialSize = 5
		       maxActive = 50
		       minIdle = 5
		       maxIdle = 25
		       maxWait = 10000
		       maxAge = 10 * 60000
		       timeBetweenEvictionRunsMillis = 5000
		       minEvictableIdleTimeMillis = 60000
		       validationQuery = "SELECT 1"
		       validationQueryTimeout = 3
		       validationInterval = 15000
		       testOnBorrow = true
		       testWhileIdle = true
		       testOnReturn = false
		       jdbcInterceptors = "ConnectionState;StatementCache(max=200)"
		       defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
		    }
        }
    }
}
