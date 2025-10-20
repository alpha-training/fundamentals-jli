/ rdb.q

h:@[hopen;5010;{x}]

if[10h=type h;-1 "Failed to connect to tickerplant on port 5010";exit 1]

sub:{[t] h(`.u.sub;t);}

sub[`]

upd:upsert

.u.end:{[d] d:`date$d;-1".u.end has been called for date= ",string [d];savetable[d;] each tables`;}

savetable:{[d;t] 
	-1"savetable called date=", string [d]," table=", string [t]," rows=", string count value t;
	system "mkdir -p data/", string d;
    (`$(":data/", string [d], "/", string t)) set value t;
	t set 0#value t;
    -1 "saved and cleared ",string [t]," for date=",string d;
	}