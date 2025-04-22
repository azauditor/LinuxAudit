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

## **Linux - Server Configuration File**
The following query obtains a system-wide configuration file
``` Bash
cp /etc/ssh/sshd_config  sshd.config.txt
```
## Basic Information on the System

This command shows default information about all system and user accounts on the system as well as information about the user's last login to the system, and whether their password is locked or login by password disabled.
``` Bash
sudo lslogins -c --time-format iso -o USER,PWD-CHANGE,PWD-EMPTY,PWD-LOCK,PWD-DENY,PWD-MIN,PWD-MAX,PWD-WARN,PWD-EXPIR,SHELL >> LoginSetting.txt
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

This is to determine if an account is assigned to another group.

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

## **Linux - PAM configuration file**
Run the following query if PAM is required for authentication.

``` Bash
cp /etc/pam.d/password-auth-ac password-auth-ac.txt
```

## Root Impersonation

This is to determine what groups/accounts can run commands as root.

``` Bash
sudo cat /etc/sudoers > Sudo.txt
```

Please check the contents of /etc/sudoers and send files referenced by an include directive ("#include" for a single file or "#includedir" for an entire directory). If the referenced file doesn't exist, provide evidence through executing `ls -a`

## **Password Settings**

These 2 commands will show all accounts and the password settings that are being applied to them. Run both as each command outputs different components of the password settings.

## Minimum and maximum password age:

``` Bash
sudo passwd --status --all > PasswordSetting.txt
```

**Alternative Commands:**

Run if the above command for minimum and maximum password age does not work.

``` Bash
sudo cat /etc/login.defs > PasswordSetting.txt
```
OR
``` Bash
sudo passwd -S -a > PasswordSetting.txt
```

If you are running **Oracle Enterprise Linux Server** use the following command. **Note**: You **MUST** run this command as root otherwise it will fail.

``` Bash
for u in `cat /etc/passwd | cut -d: -f1 | sort`; do passwd -S $u >> PasswordSetting.txt; done
```
OR
``` Bash
for u in $(cat /etc/passwd | cut -d: -f1 | sort); do passwd -S $u >> PasswordSetting.txt; done
```

If you are running **UNIX** use the following command. **Note**: You **MUST** run this command in the /etc/ folder otherwise it will fail.

``` Bash
passwd -s -a > PasswordSetting.txt
```

## Password length and complexity:

``` Bash
sudo cat /etc/security/pwquality.conf > Pwquality.txt
```
NOTE: If the server does not have a pwquality.conf file, please provide a screenshot of the "find -name pwquality.conf" command showing the file does not exist on the server.

## Valid Login Shells

This command is to determine what shells are valid to login to the system.

``` Bash
sudo cat /etc/shells > LoginShells.txt
```
