/ pubsub1.q
	
\p 5010	
	
.z.ts:{.u.pub[`trade;.u.genTrade`];.u.pub[`quote;.u.genQuote`];}
	
\d .u

SYMS:`JPM`MSFT`TSLA`AAPL
	
w:(0#`)!()

sub:{[t] w[t]:distinct w[t],.z.w; -1 "Subscribed handle ",string [.z.w]," to ",string t;}

pub1:{[t;h;x] neg[h](`upd; t; x)}

pub:{[t;x] if[not t in key w; :()]; pub1[t;;x] each w[t]}	
	  
.z.pc:{w::w except 'x; -1 "Handle ",string [x]," disconnected and cleaned up";}
	
genTrade:{N: 1 + rand 10;([] time: N#.z.p;sym:  N?SYMS;size: N?1000;price: N?100f)}
	
genQuote:{N: 1 + rand 10;([] time: N#.z.p;sym:  N?SYMS;bid:  N?100f;bidSize: N?1000;ask:  N?100f;askSize: N?1000)}
		
\t 1000	