# oss-audit-24BCE10616
## Open Source Software Audit: Git

**Student:** Vaidehi Gupta

**Roll Number:** 24BCE10616

**Course:** Open Source Software (OSS) | VIT

---

## What This Project Is About

This is my Open Source Software Audit — a project where I stopped just *using* software and actually started *understanding* it.

I chose **Git** for this audit. Not because it was the obvious choice, but because I genuinely wanted to understand why a tool I use every single day actually exists. Turns out, Git wasn't born in a boardroom. It was born out of frustration — when the Linux kernel community got locked out of their own workflow by a proprietary tool called BitKeeper in 2005. Linus Torvalds spent two weeks building Git from scratch, and the rest is history.

This project walks through that entire story — the philosophy behind Git, the GNU GPL v2 license that keeps it free forever, and what it actually looks like when Git sits on a real Linux machine. I also wrote five Bash scripts that automate different parts of the audit, because honestly, writing shell scripts to inspect your own system feels a lot more real than reading about it.

---

## My System Setup

I did everything on **WSL2** (Windows Subsystem for Linux) running **Ubuntu 24.04.4 LTS** on my laptop. It gave me a full Linux environment without needing a separate machine — and it worked great for this kind of audit.

| Detail | Info |
|---|---|
| Operating System | Ubuntu 24.04.4 LTS (WSL2) |
| Shell | GNU Bash 5.2 |
| Kernel | Linux 6.6.87.2-microsoft-standard-WSL2 |
| Audited Package | Git v2.43.0-1ubuntu7.3 |

---

## The Five Scripts I Built

Each script here was written to cover a specific part of the OSS syllabus. They're not meant to be fancy — they're meant to be honest demonstrations of what I learned.

**`script1.sh` — System Identity Report**
Think of this as a "who am I and where am I" script. It pulls your kernel version, OS name, logged-in user, home directory, uptime, and current time — all in one go. I used command substitution `$(...)` throughout, which felt like a lightbulb moment when I first got it working.

**`script2.sh` — FOSS Package Inspector**
This one checks whether Git is actually installed using `dpkg`, and if it is, it pulls the version, homepage, and download size. There's also a `case` statement that prints a short description of whatever package you're inspecting. A small touch, but it made the script feel more alive.

**`script3.sh` — Disk and Permission Auditor**
A `for` loop walks through important directories like `/etc`, `/var/log`, `/home`, `/usr/bin`, and `/tmp`, and for each one it prints the permissions and disk usage. It also checks whether your Git config files exist — both the system-level one at `/etc/gitconfig` and the user-level one at `~/.gitconfig`.

**`script4.sh` — Log File Analyzer**
Pass it a log file and a keyword (like `error` or `warning`) and it counts how many times that keyword appears, then shows you the last 5 matches. I used it on `/var/log/syslog` — it found 16 error entries on my system, which was oddly satisfying to discover.

**`script5.sh` — Open Source Manifesto Generator**
This was the most fun to write. It asks you four questions about your FOSS values and builds a short personal manifesto from your answers, then saves it as `manifesto_<yourusername>.txt`. Mine ended with *"Open source is not just code — it is people helping people."* Which I still think is pretty true.

---

## How to Run Everything

**Clone the repo first:**
```bash
git clone https://github.com/vaidehi24bce10616-spec/oss-audit-24BCE10616.git
cd oss-audit-24BCE10616
```

**Make all scripts executable (do this once):**
```bash
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
```

**Then just run them:**
```bash
./script1.sh
./script2.sh
./script3.sh
./script4.sh
./script5.sh
```

**For the log analyzer with a specific file and keyword:**
```bash
sudo ./script4.sh /var/log/syslog error
```
> `sudo` is needed here because `/var/log/syslog` isn't readable by a regular user. If you skip the keyword, it defaults to `error` anyway.

> If `script1.sh` throws an error about `lsb_release` not being found, just run `sudo apt install lsb-release` and you're good.

---

## What I Actually Learned

Going into this, I thought open source just meant "free software you download off the internet." Coming out of it, I see it completely differently.

- I learned that the Linux **Filesystem Hierarchy Standard** isn't random — every directory has a purpose, and Git follows it cleanly.
- I got genuinely comfortable with Bash — loops, conditionals, `awk`, `cut`, `grep`, file redirection — things I used to avoid or copy-paste blindly.
- I understood why `dpkg` is the right tool on Ubuntu, even though the lab manual mentioned `rpm` (which is for Red Hat systems). Adapting to the actual environment instead of just following instructions felt like real engineering.
- Most importantly, I understood the **GPL v2** — not as legal fine print, but as a document of empowerment. It's the reason anyone in the world, including a student at VIT, can download and use the same tools as a developer at Google.

---

## The Four Freedoms (Why Any of This Matters)

The GNU GPL v2 that covers Git is built around four core freedoms established by the Free Software Foundation. I mapped each one to how I actually use Git:

- **Freedom 0 — Run it.** I can use Git for this student project or for a future startup. No conditions, no license fees.
- **Freedom 1 — Study it.** I can read Git's source code in C and see exactly how Linus implemented SHA-1 hashing. No black box.
- **Freedom 2 — Share it.** This is what lets the Ubuntu community package Git and let me install it with one command.
- **Freedom 3 — Improve it.** If I find a bug, I have the legal right to fix it and contribute the fix back to the world.

---

## License

This project was created for academic purposes as part of the Open Source Software course at VIT. The scripts are free to use and learn from.

---

## A Note of Thanks

To Linus Torvalds for building Git in two weeks because he was done waiting for someone else to solve the problem. To Junio Hamano and every contributor who has maintained it since. And to the open-source community at large — for making sure that a student sitting anywhere in the world has access to the same world-class tools as anyone else. That's not a small thing. That's everything.
