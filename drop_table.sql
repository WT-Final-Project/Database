-- Table deletion file

DROP TABLE IF EXISTS project_file;
DROP TABLE IF EXISTS request;
DROP TABLE IF EXISTS task;
DROP TABLE IF EXISTS participate;
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS project;

DROP SEQUENCE IF EXISTS request_id_seq;
DROP SEQUENCE IF EXISTS task_id_seq;
DROP SEQUENCE IF EXISTS project_id_seq;
DROP SEQUENCE IF EXISTS file_id_seq;
