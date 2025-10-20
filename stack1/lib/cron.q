\l lib/event.q

\d .cron

jobs:1!flip`func`start`period`lastRun`nextRun`error!"spnpp*"$\:()
add:{[func;start;period]`.cron.jobs insert (func;start;"n"$period;0Np;start;"");} /upsert more widely used
run1:{[job;now] 
  if[now>.cron.jobs[job;`nextRun];
    e:@[value job;.z.p;{x}];
    .cron.jobs[job;`lastRun]:now;
    .cron.jobs[job;`nextRun]:now+.cron.jobs[job;`period]];
    if[10h=type e;.cron.jobs[job;`error]:e]}  / indent this back for readability

run:{run1[;x]each exec func from jobs where nextRun<x;}

\d .

.event.addHandler[`.z.ts;`.cron.run]

\t 1000

/

/ test commands
/.tst.joiner:{.tst.times,:x}
/.cron.add[`.tst.joiner;.z.p+00:00:03;00:00:05]

/nicely done well done