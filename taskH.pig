-- load data
Friends = LOAD '/Users/kelseymoody/Desktop/DS4433/Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
--AccessLog = LOAD '/Users/kelseymoody/Desktop/DS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
--MyPage = LOAD '/Users/kelseymoody/Desktop/DS4433/MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode: chararray, hobby:chararray);
-- taskH:  
grouph = GROUP Friends BY PersonID;
counth = FOREACH grouph GENERATE group AS PersonID, COUNT(Friends) AS numFriends;
averageh = FOREACH (GROUP counth ALL) GENERATE AVG(counth.numFriends) AS avgNumFriends;
joinDatah = JOIN counth BY numFriends, averageh BY avgNumFriends;
aboveAverageh = FILTER joinDatah BY counth::numFriends > averageh::avgNumFriends;
resulth = FOREACH aboveAverageh GENERATE counth.PersonID;
STORE resulth INTO '/Users/kelseymoody/Desktop/DS4433/taskH.csv' USING PigStorage(',');