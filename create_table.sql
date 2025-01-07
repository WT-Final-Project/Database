-- Table creation file

-- Project table
CREATE TABLE project (
    projectid SERIAL PRIMARY KEY,  -- Handled by Supabase
    projectname varchar(30) NOT NULL CHECK (projectName <> ''),
    description varchar(300)
);

-- User table
CREATE TABLE app_user (
    id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    username varchar(25) UNIQUE NOT NULL,  -- Enforce uniqueness for username
    firstname varchar(15) NOT NULL,
    lastname varchar(25) NOT NULL,
    email varchar(255) NOT NULL UNIQUE  -- Enforce email uniqueness
);

-- Participate table
CREATE TABLE participate (
    projectid integer,
    username varchar(25),
    userrole varchar(12) NOT NULL CHECK (userRole IN ('leader', 'participant')), -- Possible values: leader and participant
    PRIMARY KEY (projectid, username),
    FOREIGN KEY (projectid) REFERENCES project (projectid) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES app_user (username)
);

-- Task table
CREATE TABLE task (
    taskid SERIAL PRIMARY KEY,  -- Handled by Supabase
    projectid integer NOT NULL,
    username varchar(25) NOT NULL,
    tasktitle varchar(25) NOT NULL,
    description varchar(300) NOT NULL,
    duedate DATE NOT NULL,
    completed integer CHECK (completed IN (0, 1)), -- 0 means not completed
    FOREIGN KEY (projectid) REFERENCES project (projectid) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES app_user (username)
);

-- File table
CREATE TABLE project_file (
    fileid SERIAL PRIMARY KEY,  -- Handled by Supabase
    filePath TEXT NOT NULL,
    name varchar(100) NOT NULL,
    taskid integer NOT NULL,
    FOREIGN KEY (taskid) REFERENCES task (taskid)
);
