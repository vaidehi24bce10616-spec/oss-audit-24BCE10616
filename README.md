# oss-audit-24BCE10616  
This is my Open Source Software lab repo for auditing Git on Ubuntu 24.04 (WSL2).  

I’m Vaidehi Gupta (Vaidehi, reg no 24BCE10616). I wrote some small shell scripts to gather basic system info, check package info, audit a few directories, and scan a log file for keyword matches.  

What’s inside:  
script1.sh - System Identity Report (kernel, distro, uptime, etc.)

script2.sh - FOSS Package Inspector for git

script3.sh - Disk and Permission Auditor for a few common folders

script4.sh - Log file analyzer (counts keyword matches)

script5.sh - Open Source Manifesto Generator (interactive)



How to run the scripts:  
From the repo directory:  

Make them executable (one-time):  
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh  

Run them:  
./script1.sh  
./script2.sh  
./script3.sh  
sudo ./script4.sh /var/log/syslog error  
If you don’t pass a keyword, it defaults to error.  
./script5.sh  
It asks three questions and writes manifesto_<username>.txt.  

Notes (things I ran into):  
For script2.sh, the lab manual mentions rpm, but Ubuntu is based on Debian, so I used dpkg -l to check if git is installed.  
script4.sh needs sudo when I use it with /var/log/syslog because normal user permissions can block access to that file.  
If script1.sh gives an error about lsb_release, install lsb-release:  
sudo apt install lsb-release

