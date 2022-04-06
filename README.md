# LinuxAudit

The following commands are used to extract information out of a Linux Operating System.  **While these commands should work with most variants of the LINUX** this code has been verified to work with the Debian distribution.  If you are running a different variant please inform contact with which variant and version so that the command line code can be verified with your particular version.

## **Linux - Version Check**
The following queries may assist you in determining your Linux system general info.

``` Bash
 hostnamectl > sysinfo.txt
 uname -a > sysinfo.txt
 lsb_release -a > sysinfo.txt
 cat /etc/*-release > sysinfo.txt
```

## Users

This command will find all accounts including network accounts.

``` Bash
 getent passwd > Accounts.txt
```

If you are running **Red Hat Enterprise Linux** use the following command.

``` Bash
 cp /etc/passwd accounts.txt
```

If you are running **UNIX** use the following command.

``` Bash
 cat /etc/passwd > accounts.txt
```

## Groups

This is to determine if an account or group is assigned to another group.  Ex: If group A is given root access and Group B is part of Group A then those assigned to Group B has root privileges.  Same goes if Group C is assigned to Group B.

``` Bash
getent group > Group.txt
```

If you are running **Red Hat Enterprise Linux** use the following command.

``` Bash
 cp /etc/group group.txt
```

If you are running **UNIX** use the following command.

``` Bash
 cat /etc/group > group.txt
```

## Root Impersonation

This is to determine what groups/accounts can run commands as root.

``` Bash
sudo cat /etc/sudoers > Sudo.txt
```

## Password Settings

These 2 commands will show all accounts and the password settings that are being applied to them. Run both as each command outputs different components of the password settings.

Minimum and maximum password age:

``` Bash
sudo passwd --status --all > PasswordSetting.txt
```

Password length and complexity:

``` Bash
sudo /etc/security/pwquality.conf > Pwquality.txt
```

**Alternative Commands:**

Run if the above command for minimum and maximum password age does not work.

``` Bash
sudo passwd -S -a > PasswordSetting.txt
```

If you are running **Oracle Enterprise Linux Server** use the following command. **Note**: You **MUST** run this command as root otherwise it will fail.

``` Bash
for u in `cat /etc/passwd | cut -d: -f1 | sort`; do passwd -S $u >> PasswordSetting.txt; done
```

If you are running **UNIX** use the following command. **Note**: You **MUST** run this command in the /etc/ folder otherwise it will fail.

``` Bash
passwd -s -a > PasswordSetting.txt
```

## Valid Login Shells

This command is to determine what shells are valid to login to the system.

``` Bash
sudo cat /etc/shells > LoginShells.txt
```
