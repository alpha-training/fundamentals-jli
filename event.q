\d .event			

handlers:(0#`)!()		

addHandler:{[event;handler] if[0=count handlers event; handlers[event]:()];handlers[event]:handlers[event],handler}

fire:{[event;arg] if[event in key handlers;handlers[event] @\: arg;];}		

\d .

.z.po:{[h] .event.fire[`.z.po; h] }
