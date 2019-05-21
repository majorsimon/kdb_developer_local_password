# kdb-developer-daemon

Basic system user account authentication and backgrounding for Developer for Kx

What it says on the tin. A collection of scripts to be dropped into $DEVELOPER_HOME

## Requirements

Ensure have read access to /etc/shadow

Ensure openssl binary available


## Concerns
Is pretty basic, but it's enough

Doesn't work for non-local (LDAP etc.) accounts

Makes assumptions about binary locations etc.
