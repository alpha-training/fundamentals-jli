allcols:{[tabledir] get tabledir, `.d}

add1col:{[tabledir;colname;defaultvalue]
  if[not colname in allcols[tabledir];
    -1"Adding column ",string [colname]," to ",string [tabledir]," with default ",string defaultvalue;
    n:count get tabledir, first allcols[tabledir];
    @[tabledir; colname;:; n#defaultvalue];
    @[tabledir;`.d;,;colname];]
   }

delete1col:{[tabledir;col]
  if[col in allcols[tabledir];
    -1"Deleting column ",string col;
    hdel .Q.dd[tabledir]col;
    @[tabledir;`.d;:;allcols[tabledir] except col];]
  }

/ allcols`:db/2025.10.20/trade
/ add1col[`:db/2025.10.20/trade;`volume;0N]
/ delete1col[`:db/2025.10.20/trade;`volume]

/DB Edit Change#1

allpaths:{[dbdir;table]
  date:f where(f:key dbdir)like"[0-9]*";
  ` sv'dbdir,'date,\:table
 }

addcol:{[dbdir;table;colname;defaultvalue]
  add1col[;colname;defaultvalue] each allpaths[dbdir;table];
  }

deletecol:{[dbdir;table;col]
  delete1col[;col] each allpaths[dbdir;table];
  }

/ allpaths[`:db;`trade]
/ addcol[`:db;`trade;`localtime;0Np]
/ deletecol[`:db;`trade;`localtime]

/DB Edit Change#2

fncol:{[dbdir;table;col;fn] 
  fn1col[;col;fn]each allpaths[dbdir;table];}
  
castcol:{[dbdir;table;col;newtype]
	fncol[dbdir;table;col;newtype$]}

fn1col:{[tabledir;col;fn]
  if[not col in allcols[tabledir];
    :-1"Column ", string [col], " not found in ", string tabledir];
  -1"Applying function ",string [fn]," to column ", string [col]," in ", string tabledir;
  @[tabledir; col; fn];
  }

/ fncol[`:db;`trade;`price;2*]
/ castcol[`:db;`trade;`size;`short]

/DB Edit Change #3

setattrcol:{[dbdir;table;col;newattr] fncol[dbdir;table;col;newattr#];}
  
clearattrcol:{[dbdir;table;col]   
 setattrcol[dbdir;table;col;`];
 }

/ setattrcol[`:data;`trade;`sym;`g] / `s `p `u
/ clearattrcol[`:data;`trade;`sym]