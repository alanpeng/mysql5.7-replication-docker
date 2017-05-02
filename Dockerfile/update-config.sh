#!/bin/bash
if [ "$MySQL_Role" = 'Master' ]; then
	cp /etc/my-master.cnf /etc/mysql/conf.d/
        sed -i "s/{{MasterIP}}/${MasterIP}/g" /etc/mysql/conf.d/my-master.cnf
        sed -i "s/{{MySQLPort}}/${MySQLPort}/g" /etc/mysql/conf.d/my-master.cnf
fi

if [ "$MySQL_Role" = 'Slave1' ]; then
	cp /etc/my-slave1.cnf /etc/mysql/conf.d/
        sed -i "s/{{Slave1IP}}/${Slave1IP}/g" /etc/mysql/conf.d/my-slave1.cnf
        sed -i "s/{{MySQLPort}}/${MySQLPort}/g" /etc/mysql/conf.d/my-slave1.cnf
fi

if [ "$MySQL_Role" = 'Slave2' ]; then
	cp /etc/my-slave2.cnf /etc/mysql/conf.d/
        sed -i "s/{{Slave2IP}}/${Slave2IP}/g" /etc/mysql/conf.d/my-slave2.cnf
        sed -i "s/{{MySQLPort}}/${MySQLPort}/g" /etc/mysql/conf.d/my-slave2.cnf
fi
