# LinuxAudit


The following commands are used to extract information out of a Linux Operating System.  While these commands should work with most variants of the LINUX it has been verified to work with the Debian distribution.  If you are running a different variant please inform contact with which variant and version so that the command line code can be verified with your particular version.

## Users

 This command will find all accounts including network accounts.

 $ getent passwd > accounts.txt

## Groups

 This is to determine if an account or group is assigned to another group.  Ex: If group A is given root access and Group B is part of Group A then those assigned to Group B has root privileges.  Same goes if Group C is assigned to Group B.

 $ getent group > Group.txt

## Root Impersonation

 This is to determine what groups/accounts can run commands as root.

 $ sudo cat /etc/sudoers > Sudo.txt

## Password Settings

 This command will show all accounts and the password settings that are being applied to them.

 $ sudo passwd --status --all > PasswordSetting.txt

## Valid Login Shells

 This command is to determine what shells are valid to login to the system.

 $ sudo cat /etc/shells > LoginShells.txt