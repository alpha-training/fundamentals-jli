/ log.q

\d .log

print:{[msgTyp;msg] -1 " "sv(string .z.p; msgTyp; string .z.w; msg);}
info: print["INFO";]
error: print["ERROR";]

\d .