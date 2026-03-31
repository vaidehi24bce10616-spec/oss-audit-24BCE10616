#!/bin/bash

name="Vaidehi gupta"
tool="Git"

os_name=$(lsb_release -ds)
kernel_version=$(uname -r)
current_user=$(whoami)
uptime_info=$(uptime -p)
current_time=$(date "+%d-%m-%Y %I:%M:%S %p")

echo "User Name        : $name"
echo "Tool Used        : $tool"
echo ""

echo "Operating System : $os_name"
echo "Kernel Version   : $kernel_version"
echo "Logged-in User   : $current_user"
echo "Home Directory   : $HOME"
echo "System Uptime    : $uptime_info"
echo "Current Time     : $current_time"
echo ""

echo "Note: This system follows GNU GPL licensing."
