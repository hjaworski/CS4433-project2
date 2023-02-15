
-- load data - Kelsey
-- Friends = LOAD '/Users/kelseymoody/Desktop/DS4433/Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
-- AccessLog = LOAD '/Users/kelseymoody/Desktop/DS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
-- MyPage = LOAD '/Users/kelseymoody/Desktop/DS4433/MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode: chararray, hobby:chararray);

-- load data - Dante 
-- Friends = LOAD '/Users/danteamicarella/Desktop/CS4433/Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
-- AccessLog = LOAD '/Users/danteamicarella/Desktop/CS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
MyPage = LOAD '/Users/danteamicarella/Desktop/CS4433/MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode: chararray, hobby:chararray);

-- taskA:
clean1 = FILTER MyPage by nationality == 'Kenya';
clean2 = FOREACH clean1 GENERATE name, hobby;
DUMP clean2;
-- Kelsey directory 
-- STORE clean2 INTO '/Users/kelseymoody/Desktop/DS4433/taskA.csv' USING PigStorage(',');
STORE clean2 INTO '/Users/danteamicarella/Desktop/DS4433/taskA.csv' USING PigStorage(',');