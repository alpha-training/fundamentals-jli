tostr:{$[0h~type x; .z.s each x; $[10h~abs type x; x; string x]]}




/
good effort 
no need for the nested if else as it already is built into the q $ function, the logic goes as so 
$[condition 1;if true do this;condition 2;if true do this;condition 3;if true do this; else do this]

On syntax we dont need spaces after ; 

like so
tostr:{$[0=t:type x;.z.s each x;10=abs t;x;string x]}