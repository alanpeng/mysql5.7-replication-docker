#!/bin/bash
MySQLCommand="mysql -u root -p$MYSQL_ROOT_PASSWORD"

USER_EXISTS=$($MySQLCommand -BN -e 'select user from mysql.user where user="$REPLICATION_USER"')
if [ -z "$USER_EXISTS" ] && [ "$MySQL_Role" = 'Master' ]
then
    $MySQLCommand -ve 'create user '\'$REPLICATION_USER\''@'\'%\'' identified by '\'$REPLICATION_PASSWORD\'''
    $MySQLCommand -ve 'grant replication slave, replication client on *.* to '\'$REPLICATION_USER\''@'\'%\'''
    $MySQLCommand -ve 'FLUSH PRIVILEGES'
fi

if [ "$MySQL_Role" != 'Master' ]; then
        $MySQLCommand -ve 'CHANGE MASTER TO MASTER_HOST='\'$MasterIP\'', MASTER_PORT='$MySQLPort', MASTER_USER='\'$REPLICATION_USER\'', MASTER_PASSWORD='\'$REPLICATION_PASSWORD\'', MASTER_AUTO_POSITION=1'
        $MySQLCommand -ve 'START SLAVE'
fi
