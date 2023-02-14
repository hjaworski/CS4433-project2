-- load data
AccessLog = LOAD '/Users/kelseymoody/Desktop/DS4433/AccessLog.csv' USING PigStorage(',') AS (AccessId:int, WhatPage:int, ByWho:int, TypeOfAccess:chararray, AccessTime:int);
MyPage = LOAD '/Users/kelseymoody/Desktop/DS4433/MyPage.csv' USING PigStorage(',') AS (id:int, name:chararray, nationality:chararray, countryCode:chararray, hobby:chararray);

-- task E:
joinede = JOIN MyPage BY id, AccessLog BY ByWho;
groupede = GROUP joinede BY (id, ByWho);
countse = FOREACH groupede GENERATE group AS groupede, COUNT(joinede);
unique_pagese = FOREACH groupede {
    unique_pages = DISTINCT joinede.AccessLog::WhatPage;
    GENERATE group AS unique_group, COUNT(unique_pages);
}
final_resulte = JOIN countse BY groupede, unique_pagese BY unique_group;
STORE final_resulte INTO '/Users/kelseymoody/Desktop/DS4433/taskE.csv' USING PigStorage(',');

