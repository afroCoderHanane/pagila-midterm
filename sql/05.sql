-- PART 1:
-- Rewrite the SQL table below to use a maximally efficient column order.
-- You may directly modify this table.

CREATE TABLE project (
    id SERIAL PRIMARY KEY,
    author_id BIGINT NOT NULL,
    target_type VARCHAR(2),
    target_id INTEGER,
    developer_addr INET,
    developer_id UUID,
    title CHAR(256),
    data TEXT,
    project_id INTEGER NOT NULL UNIQUE,
    action SMALLINT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMPTZ
);



-- PART 2:
-- Complete the table below describing the number of bytes used by the row created by the following insert statement.
-- Use the original column order defined above,
-- and not your modified order from part 1.

INSERT INTO project VALUES (
    0,
    55,
    NULL,
    NULL,
    NULL,
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
    NULL,
    NULL,
    88,
    12,
    'now',
    '2022-03-09T18:34:27+00:00'
);

-- Header:32
-- Data:`
-- Padding:
-- Total:
---------------------------------------------------------------------------------------------------------
--ANSWERS
---------------------------------------------------------------------------------------------------------

-- --Part 1:

CREATE TABLE project (
--len 16

developer_id UUID,

--len 8

author_id BIGINT NOT NULL,
created_at TIMESTAMP WITH TIME ZONE,
updated_at TIMESTAMPTZ,


--len4

id SERIAL PRIMARY KEY,
target_id INTEGER,
project_id INTEGER NOT NULL UNIQUE,

--len2

action SMALLINT NOT NULL,

--len1

title CHAR(256),

--len -1

    target_type VARCHAR(2),
    developer_addr INET,
    data TEXT
      
);

--Part 2

INSERT INTO project VALUES (
    0,
    55,
    NULL,
    NULL,
    NULL,
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
    NULL,
    NULL,
    88,
    12,
    'now',
    '2022-03-09T18:34:27+00:00'
);

-- Header: 32
-- Data: 32-35→  36+ padding = 4
          40-47→48
	  48-63→ 64
	  64-67→ 68
	  68-69→ 70+ padding =2
          72-79→ 80
	  80-87→ 88
	  4+4+8+16+4+2+2+8+8= 56
-- Padding: 88%8==0 → padding = 0
-- Total: 88
