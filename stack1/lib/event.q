\d .event

handlers:(0#`)!()

addHandler:{[event;handler] if[not event in key handlers; handlers[event]:()];
  handlers[event],:handler; event set fire event;};

fire:{[event;arg] handlers[event]@\:arg}

\d .