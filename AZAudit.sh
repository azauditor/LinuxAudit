#!/usr/bin/env sh

if [ $(id -u) -ne 0 ]; then
  echo "This script must be executed with root privileges."
  exit 0
fi

AUDITDIR="audit-$(hostname)-$(date +%d-%m-%Y)";
mkdir "$AUDITDIR";
cd "$AUDITDIR";
hostnamectl > sysinfo1.txt;
uname -a > sysinfo2.txt;
lsb_release -a > sysinfo3.txt;
cat /etc/*-release > sysinfo4.txt;
cp /etc/ssh/sshd_config sshd.config.txt;
lslogins -c --time-format iso -o USER,UID,GROUP,GID,PWD-CHANGE,PWD-METHOD,PWD-EMPTY,PWD-LOCK,PWD-DENY,PWD-MIN,PWD-MAX,PWD-WARN,PWD-EXPIR,LAST-LOGIN,SHELL > LoginSetting.txt;
cp /etc/passwd passwd.txt;
cp /etc/group group.txt;
cp /etc/pam.d/password-auth-ac password-auth-ac.txt;
cat /etc/sudoers > Sudo.txt;
ls -al /etc/sudoers.d/ > sudoers.d.txt;
passwd --status --all > PasswordSetting.txt;
cat /etc/login.defs > login.defs.txt;
cat /etc/security/pwquality.conf > Pwquality.txt;
cat /etc/shells > LoginShells.txt;
cd ..;
zip -r AZAudit.zip "$AUDITDIR"
