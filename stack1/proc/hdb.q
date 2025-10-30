/ Create a file proc/hdb.q that exits on failure if HDB is not defined
if[""~getenv`HDB;-1"HDB not defined";exit 1];

/ Write a function called reload in hdb.q, whose job is to load in the path set by HDB
reload:{system"l ",getenv`HDB;-1"Reloaded HDB from ",getenv`HDB;};

/ Call reload on the startup of hdb.q
reload[];