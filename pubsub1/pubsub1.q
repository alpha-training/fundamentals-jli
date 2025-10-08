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

/
Kieran Feedback
This is a nice effort 
The code is well structured, and you generally use the optimal way of doing this. 
Below are some style notes, more than anything else.

pub:{[t;x] pub1[t;;x] each w t}
-> this will work fine
-> if you do func each EMPTY_LIST, then func is never called
-> so if w t is empty, pub1 is never called
-> you don't need the if check beforehand
-> style wise w t works fine here, the [] are not needed
-> though if something was to the right of w[t], then they would be needed

.z.pc:{w::w except 'x; -1 "Handle ",string [x]," disconnected and cleaned up";}
-> this is nicely done, but you can lose the whitespace after except, and after string

genTrade & genQuote
-> lots of whitespace that is not needed