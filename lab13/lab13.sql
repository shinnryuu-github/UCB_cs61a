.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' and pet = 'dog';


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students as a, students as b WHERE a.time < b.time and a.pet = b.pet and a.song = b.song;


CREATE TABLE sevens AS
  SELECT stu.seven FROM students as stu, numbers as num WHERE stu.time = num.time and stu.number = 7 and num.'7' = 'True';


CREATE TABLE favpets AS
  SELECT pet, count(*) AS cou FROM students GROUP BY pet ORDER BY cou DESC LIMIT 10;


CREATE TABLE dog AS
  SELECT pet, count(*) FROM students GROUP BY pet HAVING pet = 'dog';


CREATE TABLE bluedog_agg AS
  SELECT song, count(*) AS cou FROM bluedog_songs GROUP BY song ORDER BY cou DESC;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, count(*) AS cou FROM students WHERE seven = '7' GROUP BY instructor ORDER BY cou DESC;

