/ Inter-process communication
		
/ \l lib/event.q	
	
\d .ipc

/ conns:1!flip`name`port`handle!"sji"$\:()
conns:update handle:0Ni,status:`down,pid:0Ni from 1!("SSJ"; enlist ",") 0: `:config/processes.csv

tryConnect:{[port] @[hopen;port;0Ni]}

conn:{[n]
    if[not null h:first exec handle from conns where name=n;:h]; 
    h:tryConnect port:first exec port from conns where name=n; 
    if[not null h; 
      .ipc.conns:update handle:h,status:`up,pid:.z.i from conns where name=n];
    h}

disconnect:{[h].ipc.conns:update handle:0Ni,status:`down,pid:0Ni from conns where handle=h}

\d .

.event.addHandler[`.z.pc;`.ipc.disconnect]

/nicely done
