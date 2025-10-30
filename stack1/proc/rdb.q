/ rdb.q

h:@[hopen;5010;{x}]

if[10h=type h;-1"Failed to connect to tickerplant on port 5010";exit 1]

h1:@[hopen;5012;{x}]

if[10h=type h1;-1"Failed to connect to hdb on port 5012";exit 1]

sub:{[t] h(`.u.sub;t);}

sub[`]

upd:upsert

.u.end:{[d] d:`date$d;-1".u.end has been called for date= ",string [d];savetable[d;] each tables`;neg[h1](`reload;())}

savetable:{[d;t] 
	-1"savetable called date=",string [d]," table=",string [t]," rows=",string count value t;
	`sym`time xasc t;
    update `p#sym from t;
	(`$(":",getenv[`HDB],"/",string [d],"/",string [t],"/"))set .Q.en[`$(":",getenv`HDB);value t];
	t set 0#value t;
    -1 "saved and cleared ",string [t]," for date=",string d;
	}