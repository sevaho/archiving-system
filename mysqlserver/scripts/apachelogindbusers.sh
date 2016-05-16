#!/bin/bash

mysql -uroot -proot -bse "create database if not exists users";

mysql -uroot -proot users<< EOF

CREATE TABLE IF NOT EXISTS users (
    user_id int(5) NOT NULL AUTO_INCREMENT,
    username varchar(20) DEFAULT NULL,
    password varchar(20) DEFAULT NULL,
    PRIMARY KEY(user_id)
    );

EOF
