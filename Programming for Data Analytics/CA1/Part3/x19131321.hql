CREATE EXTERNAL TABLE IF NOT EXISTS x19131321(
    id int,
    realDate string, 
    word string, 
    randomCharacter string, 
    bigRandom int, 
    randomString string, 
    smallRandom int,
    username string,
    groupname string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

load data inpath 'file////home/hduser/Part3/x19131321.txt' into table x19131321;

INSERT OVERWRITE DIRECTORY 'file////home/hduser/Part3/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
select max(bigRandom), avg(bigRandom) from x19131321 WHERE groupname = 'group1';