/ feed.q

h:hopen 5010

SYMS:`JPM`MSFT`TSLA`AAPL

genTrade:{N:1+rand 1000;value flip([]time:N#.z.p;sym:N?SYMS;size:N?1000;price:N?100f;exchange:N?`N`L`T)}
	
genQuote:{N:1+rand 1000;value flip([]time:N#.z.p;sym:N?SYMS;bid:N?100f;bidSize:N?1000;ask:N?100f;askSize:N?1000;exchange:N?`N`L`T)}

.z.ts:{neg[h](`.u.upd;`trade;genTrade`);neg[h](`.u.upd;`quote;genQuote`);}

\t 100

/nicely done