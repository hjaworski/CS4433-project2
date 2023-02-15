
-- load data
-- Kelsey
-- Friends = LOAD '/Users/kelseymoody/Desktop/DS4433/Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
-- AccessLog = LOAD '/Users/kelseymoody/Desktop/DS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);
-- Dante
Friends = LOAD 'Friends.csv' USING PigStorage(',') AS (FriendRel:int, PersonID:int, MyFriends: int, DateOfFriendship:int, Desc: chararray);
AccessLog = LOAD 'AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime: int);


-- task F:
friendAccess = JOIN Friends BY MyFriends, AccessLog BY ByWho;
friendAccess2 = FILTER friendAccess BY WhatPage == Friends::PersonID;
friendsWithAccess = DISTINCT friendAccess2;
allFriends = DISTINCT Friends::PersonID;
friendsWithoutAccess = FILTER allFriends NOT IN (PersonID IN friendsWithAccess::PersonID);

-- Extract PersonIDs
result = FOREACH friendsWithoutAccess GENERATE PersonID;
-- Kelsey
-- STORE result INTO '/Users/kelseymoody/Desktop/DS4433/taskF.csv' USING PigStorage(',');
-- Dante
STORE result INTO 'PIGoutputF' USING PigStorage(',');


