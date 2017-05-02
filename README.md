# mysql5.7.18 replication with docker
All nodes use the same docker image. You can start a MySQL Replication Cluster with 1 Master node and 1 Slave node or 2 Slave nodes.

MySQL port is set to 3307 as MaxScale will use 3306.  ( https://github.com/alanpeng/maxscale1.4.5-1-docker )

```
docker run -itd --name=MySQL-Cluster-Master --hostname=Master -e MySQL_Role=Master -e MYSQL_ROOT_PASSWORD=password -e REPLICATION_USER=repluser -e REPLICATION_PASSWORD=88888888 -e MasterIP=172.20.10.10 -e Slave1IP=172.20.10.11 -e Slave2IP=172.20.10.12 -e MySQLPort=3307 -p 3307:3306 -v /var/lib/mysql:/var/lib/mysql alanpeng/mysql5.7-replication-docker
```

```
docker run -itd --name=MySQL-Cluster-Slave1 --hostname=Slave1 -e MySQL_Role=Slave1 -e MYSQL_ROOT_PASSWORD=password -e REPLICATION_USER=repluser -e REPLICATION_PASSWORD=88888888 -e MasterIP=172.20.10.10 -e Slave1IP=172.20.10.11 -e Slave2IP=172.20.10.12 -e MySQLPort=3307 -p 3307:3306 -v /var/lib/mysql:/var/lib/mysql alanpeng/mysql5.7-replication-docker
```

```
docker run -itd --name=MySQL-Cluster-Slave2 --hostname=Slave2 -e MySQL_Role=Slave2 -e MYSQL_ROOT_PASSWORD=password -e REPLICATION_USER=repluser -e REPLICATION_PASSWORD=88888888 -e MasterIP=172.20.10.10 -e Slave1IP=172.20.10.11 -e Slave2IP=172.20.10.12 -e MySQLPort=3307 -p 3307:3306 -v /var/lib/mysql:/var/lib/mysql alanpeng/mysql5.7-replication-docker
```

```
MasterNode:
  hostname: Master
  environment:
    MySQL_Role: Master
    MYSQL_ROOT_PASSWORD: password
    REPLICATION_USER: repluser
    REPLICATION_PASSWORD: '88888888'
    MasterIP: 172.20.10.10
    Slave1IP: 172.20.10.11
    Slave2IP: 172.20.10.12
    MySQLPort: 3307
  tty: true
  image: alanpeng/mysql5.7-replication-docker
  ports:
   - 3307:3306/tcp
  volumes:
  - /var/lib/mysql:/var/lib/mysql
  stdin_open: true
```

```
Slave1Node:
  hostname: Slave1
  environment:
    MySQL_Role: Slave1
    MYSQL_ROOT_PASSWORD: password
    REPLICATION_USER: repluser
    REPLICATION_PASSWORD: '88888888'
    MasterIP: 172.20.10.10
    Slave1IP: 172.20.10.11
    Slave2IP: 172.20.10.12
    MySQLPort: 3307
  tty: true
  image: alanpeng/mysql5.7-replication-docker
  ports:
   - 3307:3306/tcp
  volumes:
  - /var/lib/mysql:/var/lib/mysql
  stdin_open: true
```

```
Slave2Node:
  hostname: Slave2
  environment:
    MySQL_Role: Slave2
    MYSQL_ROOT_PASSWORD: password
    REPLICATION_USER: repluser
    REPLICATION_PASSWORD: '88888888'
    MasterIP: 172.20.10.10
    Slave1IP: 172.20.10.11
    Slave2IP: 172.20.10.12
    MySQLPort: 3307
  tty: true
  image: alanpeng/mysql5.7-replication-docker
  ports:
   - 3307:3306/tcp
  volumes:
  - /var/lib/mysql:/var/lib/mysql
  stdin_open: true
```
