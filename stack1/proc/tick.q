\p 5010

\d .u

COLS_DICT:()!()
COLS_DICT[`trade]:`time`sym`size`price
COLS_DICT[`quote]:`time`sym`bid`ask`bidSize`askSize

upd1:{[t;h;x] neg[h](`upd;t;x)}

upd:{[t;x]
 if[type x;'"this must be a list of lists"];
 a: COLS_DICT[t];
 tab: flip a!x;
 upd1[t;;tab] each w t;
 }

w:(0#`)!()

sub:{[t] if[null t;:.z.s each key COLS_DICT];0N!t;w[t]:distinct w[t],.z.w;-1 "Subscribed handle ",string[.z.w]," to table ",string t;}

.z.pc:{w::w except'x; -1 "Handle ",string[x]," disconnected and cleaned up";}

endofday:{[d] d:d-1D;hs: distinct raze value w;neg[hs]@\:(`.u.end;d);}

\l lib/event.q
\l lib/cron.q

.cron.add[`.u.endofday;.z.p+00:00:30;00:01:00]
\d .