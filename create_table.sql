-- Table creation file

CREATE SEQUENCE project_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;

-- Project table
CREATE TABLE project (
    projectId integer DEFAULT nextval('project_id_seq') PRIMARY KEY,
    projectName varchar(30) NOT NULL CHECK (projectName <> ''),
    description varchar(300)
);

-- User table
CREATE TABLE app_user (
    username varchar(25) PRIMARY KEY CHECK (username <> ''),
    firstName varchar(15) NOT NULL CHECK (firstName <> ''),
    userPassword varchar(10) NOT NULL CHECK (userPassword <> ''),
    email varchar(20) NOT NULL CHECK (email <> ''),
    lastName varchar(25) NOT NULL CHECK (lastName <> '')
);

-- Participate table
CREATE TABLE participate (
    projectId integer,
    username varchar(25),
    userRole varchar(12) NOT NULL, -- Possible values: leader and participant
    PRIMARY KEY (projectId, username),
    FOREIGN KEY (projectId) REFERENCES project (projectId) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES app_user (username)
);

-- Sequence for taskId ranges from 1 to 999
CREATE SEQUENCE task_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;

-- Task table
CREATE TABLE task (
    taskId integer DEFAULT nextval('task_id_seq') PRIMARY KEY,
    projectId integer NOT NULL,
    username varchar(25) NOT NULL,
    taskTitle varchar(25) NOT NULL,
    description varchar(300) NOT NULL,
    dueDate DATE NOT NULL,
    completed integer CHECK (completed IN (0, 1)), -- 0 means not completed
    FOREIGN KEY (projectId) REFERENCES project (projectId) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES app_user (username)
);

-- Sequence for requestId ranges from 1 to 999
CREATE SEQUENCE request_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;

-- Request table
CREATE TABLE request (
    requestId integer DEFAULT nextval('request_id_seq') PRIMARY KEY,
    projectId integer NOT NULL,
    username varchar(25) NOT NULL,
    description varchar(300) NOT NULL,
    requestTitle varchar(25) NOT NULL,
    FOREIGN KEY (projectId) REFERENCES project (projectId) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES app_user (username)
);

-- Sequence for fileId ranges from 1 to 999
CREATE SEQUENCE file_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 999
    NO CYCLE;

-- File table
CREATE TABLE project_file (
    fileId integer DEFAULT nextval('file_id_seq') PRIMARY KEY,
    fileName varchar(20) NOT NULL,
    taskId integer NOT NULL,
    FOREIGN KEY (taskId) REFERENCES task (taskId)
);
