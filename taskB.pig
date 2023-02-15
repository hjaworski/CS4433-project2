-- load data
-- Kelsey:
-- Friends = LOAD '/Users/kelseymoody/Desktop/DS4433/Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
-- AccessLog = LOAD '/Users/kelseymoody/Desktop/DS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
-- MyPage = LOAD '/Users/kelseymoody/Desktop/DS4433/MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode: chararray, hobby:chararray);
-- Dante:
AccessLog = LOAD 'AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
MyPage = LOAD 'MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode: chararray, hobby:chararray);


joined = JOIN AccessLog BY WhatPage, MyPage BY id;
grouped = GROUP joined BY (id, name, nationality);
counts = FOREACH grouped GENERATE group, COUNT(joined);
sorted = ORDER counts BY $1 DESC PARALLEL 1;
top_8 = LIMIT sorted 8;
-- Kelsey:
-- STORE top_8 into '/Users/kelseymoody/Desktop/DS4433/taskB.csv' USING PigStorage(',');
-- Dante:
STORE top_8 into 'taskB.csv' USING PigStorage(',');