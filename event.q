\d .event			

handlers:(0#`)!()		

addHandler:{[event;handler] if[0=count handlers event; handlers[event]:()];handlers[event]:handlers[event],handler}

fire:{[event;arg] if[event in key handlers;handlers[event] @\: arg;];}		

\d .

.z.po:{[h] .event.fire[`.z.po; h] }

/
A good start! At present, this only supports .z.po (open) events; so doing the following works for me:

/event.q
q)myOpenFunc1:{-1"Handle opened on ",string x;}
q).event.addHandler[`.z.po;`myOpenFunc1]
q)\p 5000

/client, separate terminal
q)h:hopen 5000

/event.q
q)Handle opened on 6

But this doesn't yet support .z.pc (close) events. I'd suggest doing something like this:


\d .event			/ we are going to put our code in the .event namespace

handlers:(0#`)!()		/ dictionary of event names to handlers

addHandler:{[event;handler] if[not event in key handlers; handlers[event]:()];
  handlers[event],:handler; event set fire event;};

fire:{[event;arg] handlers[event]@\:arg}

\d .


/
A good start! At present, this only supports .z.po (open) events; so doing the following works for me:

/event.q
q)myOpenFunc1:{-1"Handle opened on ",string x;}
q).event.addHandler[`.z.po;`myOpenFunc1]
q)\p 5000

/client, separate terminal
q)h:hopen 5000

/event.q
q)Handle opened on 6

But this doesn't yet support .z.pc (close) events. I'd suggest doing something like this:


\d .event			/ we are going to put our code in the .event namespace

handlers:(0#`)!()		/ dictionary of event names to handlers

addHandler:{[event;handler] if[not event in key handlers; handlers[event]:()];
  handlers[event],:handler; event set fire event;};

fire:{[event;arg] handlers[event]@\:arg}

\d .


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