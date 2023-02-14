-- load data
Friends = LOAD '/Users/kelseymoody/Desktop/DS4433/Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
--AccessLog = LOAD '/Users/kelseymoody/Desktop/DS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
MyPage = LOAD '/Users/kelseymoody/Desktop/DS4433/MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode: chararray, hobby:chararray);
-- taskD:
joinedd = JOIN MyPage BY id, Friends BY MyFriends;
flattenedd = FOREACH joinedd GENERATE MyPage::id, MyPage::name, Friends::MyFriends;
groupedd = GROUP flattenedd BY (id, name);
countedd = FOREACH groupedd GENERATE group, COUNT(flattenedd.MyFriends);
STORE countedd INTO '/Users/kelseymoody/Desktop/DS4433/taskD.csv' USING PigStorage(',');