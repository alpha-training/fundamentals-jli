\d .event			

handlers:(0#`)!()		

addHandler:{[event;handler] if[0=count handlers event; handlers[event]:()];handlers[event]:handlers[event],handler}

fire:{[event;arg] if[event in key handlers;handlers[event] @\: arg;];}		

\d .

.z.po:{[h] .event.fire[`.z.po; h] }

/
This is great work! My only suggestion is splitting this up into lines to make it more readable (see below):


\d .event			

handlers:(0#`)!()		

addHandler:{[event;handler] 
    if[not event in key event handlers; handlers[event]:()];
    handlers[event]:handlers[event],handler;
    }

fire:{[event;arg] if[event in key handlers;handlers[event] @\: arg;];}		

\d .

.z.po:{[h] .event.fire[`.z.po; h]}


As a suggestion for the future - just so you don't have to fire each event individually consider something like this:


\d .event			/ we are going to put our code in the .event namespace

handlers:(0#`)!()		/ dictionary of event names to handlers

addHandler:{[event;handler] if[not event in key handlers; handlers[event]:()];
  handlers[event],:handler; event set fire event;};

fire:{[event;arg] handlers[event]@\:arg}

\d .


What "event set first event" does is sets the fire function for that event: so this will work for .z.pc, .z.pn etc.