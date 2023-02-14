-- load data
Friends = LOAD '/Users/kelseymoody/Desktop/DS4433/Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
AccessLog = LOAD '/Users/kelseymoody/Desktop/DS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
MyPage = LOAD '/Users/kelseymoody/Desktop/DS4433/MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode: chararray, hobby:chararray);
-- taskG: did by 5 days
groupg = GROUP AccessLog BY ByWho;
maxg = FOREACH groupg GENERATE group AS ByWho, MAX(AccessLog.AccessTime) AS maxAccessTime;
findg = FILTER maxg BY ((1000000 - maxAccessTime) >= 432000);
STORE findg INTO '/Users/kelseymoody/Desktop/DS4433/taskG.csv' USING PigStorage(',');