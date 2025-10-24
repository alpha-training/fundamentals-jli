/ allcols`:db/2025.10.20/trade
allcols:{[tabledir] get tabledir, `.d}

/ add1col[`:db/2025.10.20/trade;`volume;0N]
add1col:{[tabledir;colname;defaultvalue]
  if[not colname in allcols[tabledir];
    -1"Adding column ",string [colname]," to ",string [tabledir]," with default ",string defaultvalue;
    n:count get tabledir, first allcols[tabledir];
    @[tabledir; colname;:; n#defaultvalue];
    @[tabledir;`.d;,;colname];]
   }

/ delete1col[`:db/2025.10.20/trade;`volume]
delete1col:{[tabledir;col]
  if[col in allcols[tabledir];
    -1"Deleting column ",string col;
    hdel .Q.dd[tabledir]col;
    @[tabledir;`.d;:;allcols[tabledir] except col];]
  }