-- CREATE DATABASE wikift;
-- USE wikift;
-- 路由表
DROP TABLE IF EXISTS role;
CREATE TABLE role (
  r_id          BIGINT(20) NOT NULL AUTO_INCREMENT,
  r_name        VARCHAR(255)        DEFAULT NULL,
  r_description VARCHAR(255)        DEFAULT NULL,
  PRIMARY KEY (r_id)
);
-- 用户表
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  u_id       BIGINT(20)   NOT NULL AUTO_INCREMENT,
  u_username VARCHAR(255) NOT NULL,
  u_password VARCHAR(255) NOT NULL,
  PRIMARY KEY (u_id)
);
-- 用户路由关系表
DROP TABLE IF EXISTS users_role_relation;
CREATE TABLE users_role_relation (
  urr_user_id BIGINT(20) NOT NULL,
  urr_role_id BIGINT(20) NOT NULL,
  CONSTRAINT FK_user_id FOREIGN KEY (urr_user_id) REFERENCES users (u_id),
  CONSTRAINT FK_role_id FOREIGN KEY (urr_role_id) REFERENCES role (r_id)
);
-- 用户组表
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
  g_id          BIGINT(20)   NOT NULL AUTO_INCREMENT,
  g_name        VARCHAR(255) NOT NULL,
  g_description VARCHAR(255) NOT NULL,
  g_enabled     BOOLEAN      NOT NULL DEFAULT TRUE,
  PRIMARY KEY (g_id)
);
-- 用户与组关系表
DROP TABLE IF EXISTS users_groups_relation;
CREATE TABLE users_groups_relation (
  ugr_user_id  BIGINT(20) NOT NULL,
  ugr_group_id BIGINT(20) NOT NULL,
  CONSTRAINT FK_user_relation_id FOREIGN KEY (ugr_user_id) REFERENCES users (u_id),
  CONSTRAINT FK_group_relation_id FOREIGN KEY (ugr_group_id) REFERENCES groups (g_id)
);