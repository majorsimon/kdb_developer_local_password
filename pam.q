// DODGY STUFF HERE

// requires read access to /etc/shadow
// shadow group membership should be sufficient
// also requires openssl installed
// only works for local accounts, not LDAP etc.

\d .pam

getShadowPasswordHash: {[user]
  shadow: flip `username`password`lastchange`minchange`maxchange`warn`inactive`expire! ("S*IIIIII";":")0:`:/etc/shadow;
  :first exec password from shadow where username=user
 };

hashPassword: {[pass; salt; algo]
  res: system "openssl passwd -", algo, " -salt ", salt, " ", pass;
  :res 0
 };

checkPassword: {[user; pass]
  shadowpass: getShadowPasswordHash[user];
  if[all null shadowpass; :0b];
  split: 1_"$" vs shadowpass;
  algo: split 0;
  salt: split 1;
  shadowhash: split 2;
  
  hashed: hashPassword[pass; salt; algo];

  hashed ~ shadowpass
 };

