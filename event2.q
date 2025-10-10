\d .event			/ we are going to put our code in the .event namespace

handlers:(0#`)!()		/ dictionary of event names to handlers

addHandler:{[event;handler] if[not event in key handlers; handlers[event]:()];
  handlers[event],:handler; event set fire event;};

fire:{[event;arg] handlers[event]@\:arg}

\d .
