/ Load any common libraries
/ Load the process config file
/ Load the relevant process file from the proc folder
/ Listen on the appropriate port

if[""~getenv`DATA;-1 "DATA not defined";exit 1];

\l lib/log.q
\l lib/event.q
\l lib/ipc.q
\l lib/cron.q

\d .boot

if[not `proc in key ARGS:first each .Q.opt .z.x;-1"missing argument: q boot.q -proc [PROC]";exit 1];

PROC:ARGS`proc;

processes:("SSJ"; enlist",") 0:`:config/processes.csv

bt:{[n]
    if[n~"tp1";-1"This is a tickerplant";system"p ",string[first exec port from processes where name=`$n]];
    if[n~"rdb1";-1"This is a Realtime Database";];
    if[n~"hdb1";-1"This is a History Database";];
    system"l proc/",string[first exec proc from processes where name=`$n],".q";
    }
\d .

.boot.bt[.boot.PROC]