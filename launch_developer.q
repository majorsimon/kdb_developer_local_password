// load my pam checker module first, and initialise .z.pw (Developer handles the rest)
system "l ", getenv[`DEVELOPER_HOME],"/pam.q"
.z.pw: .pam.checkPassword
system "l ", getenv[`DEVELOPER_HOME],"/launcher.q_"

