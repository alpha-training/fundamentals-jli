/ Inter-process communication
		
\l code/fundamentals-jli/event2.q	
	
\d .ipc

conns:1!flip`name`port`handle!"sji"$\:()

tryConnect:{[port] @[hopen;port;0Ni]}

conn:{[n]
    if[not null h:first exec handle from conns where name=n;:h]; 
    h:tryConnect port:first exec port from conns where name=n; 
    if[not null h; 
      .ipc.conns:update handle:h from conns where name=n];
    h}

disconnect:{[h].ipc.conns:update handle:0Ni from conns where handle=h}

\d .

.event.addHandler[`.z.pc;`.ipc.disconnect]

/nicely done
