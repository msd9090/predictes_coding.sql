--- TABLE in sql used for create a database able table.
--- Length is work as a calcuating string person and typically returns the number of characters in the provided
--- CHAR stores fixed-length data and pads extra spaces or creates fixed-length string data 
--- VARCHAR2 stores variable-length data, saving storage space or writing variable-length data .
--- A view is a virtual table created by a SELECT query.It does not store data from more tables in a stuctured way . in this mean we can created table by a SELECT 
--- BLOB (Binary large object) is a data type used to target a variable amount of binary data as a single database object.
--- A composite primary primary key uses two or more columns together to uniquely idneify each row when one column alone isn't sufficient  or relationships specify columns.
--- WEERE filters individual rows before grouping or aggreagtion , so it can't use aggregate functions like sum or count; in that sense, it uses existing request data without aggreate functions;
--- HAVING filters the resulting groups after group by group by ; so it's mean you can used that tools as a aggregate functions
--- A PRIMARY KEY uniquely idenifies each row in a table, and he master meaning starts with table identification . in anther hand i combines UNIQUE + NOT NULL
--- you can to add many UNIQUE constraints per table.
--- SQL DISTINCT clause is used to remove duplicate values from query results or target one column or more and remove the rest of the columns, but not really reoveming columns, just show oreder
--- DELECT is have some has name's mean statement is used to remove rows from a database table.
--- BETWEEN statement used to  select values within a range 
--- LIKE is tools in sql used within a WHERE seacher specified pattern in a column.
CREATE TABLE aveage_issue(
    id INTEGER PRIMARY KEY ,
    age INTEGER NOT NULL ,
    body_length INTEGER NOT NULL ,
    BMI_body INTEGER NOT NULL  UNIQUE, 
    fat_body INTEGER NOT NULL  
);
INSERT INTO aveage_issue VALUES(1 , 22 , 180 , 22 , 22);
INSERT INTO aveage_issue VALUES(2 , 19 , 170 , 13 , 10);
INSERT INTO aveage_issue VALUES(3 , 5 , 100  , 9 , 7);
INSERT INTO aveage_issue VALUES(4 , 30 , 190 , 18 , 5);

CREATE TABLE average_issue_school_name (
    ProductDEscription VARCHAR(5),
    ProductName VARCHAR(5)
);
INSERT INTO average_issue_school_name VALUES('cheang mathorbord','fix labtops');
INSERT INTO average_issue_school_name VALUES('buy more screen bord', 'create money');
INSERT INTO average_issue_school_name VALUES('giving whole bean coffee', 'study reivews coffee');
INSERT INTO average_issue_school_name VALUES('adjust Quality medicine','start give medicine');

CREATE TABLE average_issue_university_name (
    student_boy_UAE CHAR(5),
    student_gril_UAE CHAR(5),
    student_boy_EPY CHAR(5),
    student_gril_EPY CHAR(5),
    UNIQUE (student_boy_UAE , student_gril_UAE)
);

INSERT INTO average_issue_university_name VALUES('Ahmaed','khadija','Mahmoud','Noura');
INSERT INTO average_issue_university_name VALUES('Ail','Layla','Omar','lila');
INSERT INTO average_issue_university_name VALUES('Amir','Kaiden','Zayden','Lila');
INSERT INTO average_issue_university_name VALUES('Kaiden','lmani','Ahmaed','Amirah');

CREATE TABLE average_issue_image(
    imageID INTEGER PRIMARY KEY,
    imageData_boy_student_UAE BINARY(5),
    imageData_gril_student_UAE BINARY(5),
    imageDate_boy_student_EPY BINARY(5),
    imageDate_gril_sudent_EPY BINARY(5)
);

CREATE TABLE file_average_issue_image(
    Id INT NOT NULL,
    name_boy VARCHAR(5) NOT NULL,
    files VARBINARY(5), -- I thoutgh file name --
    name_girl VARCHAR(5),
    files_1 VARBINARY(5) 
);

INSERT INTO file_average_issue_image VALUES(1,'Ahmaed','file1','khadija','file2');
INSERT INTO file_average_issue_image VALUES(2,'Amir','file1','Lila','file2');
INSERT INTO file_average_issue_image VALUES(3,'Kaiden','file1','Amirah','file2');
INSERT INTO file_average_issue_image VALUES(4,'Ail','file1','Noura','file2');



CREATE TABLE tinyblob_example(
    description VARCHAR(20),
    example TINYBLOB,
    desciption_2 VARCHAR(20),
    example_2 TINYBLOB,
    UNIQUE (description  , desciption_2)
);


INSERT INTO tinyblob_example VALUES('Normal foo','foo','can you','you'),('Trailing spaces foo','foo   ','he arrive school' , 'arriv'),('NULLed',NULL, 'amNULLmed',NULL);
SELECT description , LENGTH(example) AS lenght FROM tinyblob_example;
SELECT desciption_2 , LENGTH(example_2) AS lenght FROM tinyblob_example;

CREATE TABLE tinytext_example(
    sentence VARCHAR(20),
    summary TINYTEXT
);
INSERT INTO tinytext_example VALUES('normal foo','foo'),('can you','you'),('Trailing spaces foo','foo   ');
SELECT sentence , LENGTH(summary) AS lenght FROM tinytext_example;

CREATE TABLE text_example(
    major_student VARCHAR(20),
    content TEXT
);
INSERT INTO text_example VALUES('data sicentest','data');
INSERT INTO text_example VALUES('ML engineer','ML');
INSERT INTO text_example VALUES('python develop', 'python ');
INSERT INTO text_example VALUES('web develp','javescrip');

SELECT content , LENGTH(major_student) AS lenght FROM text_example;
CREATE TABLE blob_example(
    years_experience VARCHAR(10),
    words blob
    );
INSERT INTO blob_example VALUES('asdga ten' , 'ten' );
INSERT INTO blob_example VALUES('daedg two','two');
INSERT INTO blob_example VALUES('darWE five','five');
INSERT INTO blob_example VALUES('akgjaw seven','seven');
SELECT years_experience ,LENGTH(words) as lenght FROM blob_example;
SELECT major_student , LENGTH(content) as lenght FROM text_example;
SELECT name_boy , LENGTH(files_1) as lenght FROM file_average_issue_image;
--- A left JOIN returns all rows from the left table and the matching rows from the hirght
---- in the mean bulid relationship by two or more left JOIN
SELECT text_example.major_student , blob_example.words FROM text_example
LEFT JOIN blob_example ON text_example.content = blob_example.words
ORDER BY text_example.major_student;


--- A INNER JOIN returns only matches that exist in both tables or creat table form exist in both tables
SELECT average_issue_school_name.ProductName , average_issue_university_name.student_boy_UAE FROM average_issue_school_name
INNER JOIN average_issue_university_name ON average_issue_school_name.ProductDEscription = average_issue_university_name.student_boy_EPY;


--- A RIGHT JOIN is target all rows from the right table plus matches from he left 
SELECT file_average_issue_image.name_boy  , aveage_issue.age FROM aveage_issue
LEFT JOIN file_average_issue_image ON file_average_issue_image.files = aveage_issue.BMI_body
ORDER BY file_average_issue_image.name_boy;


--- A FULL JOIN returns all returns all rows from either table  
SELEct tinyblob_example.example , tinytext_example.sentence FROM tinyblob_example
LEFT JOIN tinytext_example ON tinyblob_example.example_2 = tinytext_example.summary
ORDER BY tinyblob_example.example;

--- Look that RIGHT join FULL join don't work in thoose tables so I cheang thoose codes




SELECT BMI_body , COUNT(*) AS body FROM aveage_issue
WHERE age <6 GROUP by BMI_body;


SELECT fat_body , COUNT(*) AS fat FROM aveage_issue
WHERE fat_body > 9 ;



SELECT body_length ,COUNT(*) AS lenght FROM aveage_issue
WHERE body_length > 170;


SELECT BMI_body , SUM(age) as age_BMI FROM aveage_issue
GROUP BY fat_body HAVING SUM(age)> 10;


SELECT fat_body , SUM(BMI_body) as BMI_fat FROM aveage_issue
GROUP By body_length HAVING SUM(BMI_body) > 20;



SELECT age, SUM(fat_body) AS fat_age FROM aveage_issue
GROUP by BMI_body HAVING SUM(fat_body) < 20;


--- CTE is an essential tool for simplifying complex queries and making them more readable. and clearly required information
WITH sumavarage_issue AS (
    SELECT id , AVG(BMI_body) AS sumbmi_body
    FROM aveage_issue
    GROUP BY id
)
SELECT
    s.id,
    s.sumbmi_body
FROM 
    sumavarage_issue s
WHERE
    s.sumbmi_body >2;
-- Example condition to filter by the calculated average BMI
WITH AVG_healthe_body AS(
    SELECT age , AVG(body_length) AS aveage_health_body
    FROM aveage_issue
    GROUP by age
)
SELECT
    A.age,
    A.aveage_health_body
FROM 
    AVG_healthe_body A ;

---
SELECT DISTINCT student_boy_UAE FROM average_issue_university_name;
SELECT DISTINCT student_boy_EPY FROM average_issue_university_name;
SELECT DISTINCT student_gril_UAE FROM average_issue_university_name;
SELECT DISTINCT student_gril_EPY FROM average_issue_university_name;

SELECT name_boy , name_girl FROM file_average_issue_image ORDER BY files_1 DESC;
SELECT * FROM file_average_issue_image;
SELECT files_1 , files  FROM file_average_issue_image ORDER BY name_boy DESC;

SELECT major_student FROM text_example ORDER BY content;
SELECT content FROM text_example ORDER BY major_student;

DELETE FROM aveage_issue WHERE body_length > 100;
DELETE FROM aveage_issue WHERE fat_body > 10;
DELETE FROM average_issue_university_name WHERE student_boy_UAE =='Ahmaed';
DELETE FROM average_issue_university_name WHERE student_boy_EPY =='Mahmoud';


SELECT years_experience FROM blob_example WHERE years_experience BETWEEN 'ten' AND 'seven';
SELECT * FROM aveage_issue WHERE age BETWEEN  5 and 30;
SELECT * FROM text_example WHERE content BETWEEN 'data' and 'javescrip';
SELECT summary FROM tinytext_example WHERE summary BETWEEN 'foo' AND 'foo   ';

SELECT * FROM tinyblob_example WHERE description LIKE 'N%';
SELECT * FROM tinyblob_example WHERE description LIKE 'C%';
SELECT * FROM tinyblob_example WHERE example_2 LIKE 'N%';
SELECT * FROM tinyblob_example WHERE example LIKE 'f%';

--- thanks for wathing :)
