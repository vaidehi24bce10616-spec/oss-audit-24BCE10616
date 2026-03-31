#!/bin/bash

dirs=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "system directory audit"
echo ""

for dir in "${dirs[@]}"
do
    if [ -d "$dir" ]
    then
        perms=$(ls -ld "$dir" | awk '{print $1, $3, $4}')
        size=$(du -sh "$dir" 2>/dev/null | cut -f1)

        echo "$dir -> $perms | $size"
    else
        echo "$dir not found"
    fi
done

echo ""
echo "checking git config"

sys_git="/etc/gitconfig"
user_git="$HOME/.gitconfig"

if [ -f "$sys_git" ]
then
    p=$(ls -l "$sys_git" | awk '{print $1}')
    echo "system git config found: $sys_git"
    echo "perms: $p"
elif [ -f "$user_git" ]
then
    p=$(ls -l "$user_git" | awk '{print $1}')
    echo "user git config found: $user_git"
    echo "perms: $p"
else
    echo "no git config file found"
fi
