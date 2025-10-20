/ log.q

\d .log

print:{[msgTyp;msg] -1 " "sv(string .z.p; msgTyp; string .z.w; msg);}
info: print["INFO";]
error: print["ERROR";]

\d .

/"""
very nice, like the use of sv
two things
-> we dont need the trailing ; after "INFO"; as the missing argument is automatically inferred.
-> We then also dont need the square brackets in the print function either saving character print"ERROR"
will work just aswell. 
"""