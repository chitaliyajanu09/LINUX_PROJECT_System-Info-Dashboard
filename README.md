# L100 – System Info Dashboard

**Student:** Janu Chitaliya  
**Roll No.:** F09  
**Division:** G  
**Course:** OS Linux Lab 260120510  
**Project ID:** L38

## Problem

Build a menu-based dashboard that displays system information and automatically saves system snapshots using Linux commands and Bash scripting.

## Who Will Use It

Students learning Linux system commands and Bash scripting.

## Folder Structure

```text
sysdash/
├── main.sh
├── README.md
├── lib/
│   └── functions.sh
├── data/
│   └── snapshots/
├── reports/
├── backups/
└── logs/
```

## Features

1. Display OS and kernel information using `uname -a` and current user using `whoami`.
2. Display logged-in users using `who` and system uptime.
3. Display disk usage using `df -h` and folder size using `du -sh`.
4. Display the top 5 processes by memory usage.
5. Save system snapshots with date and time.
6. View saved system data.
7. Create compressed backups.
8. Maintain activity logs.

## How to Run

```bash
cd ~/linux_project/sysdash
chmod +x main.sh
./main.sh
```

## Crontab Task

The cron job runs every hour and saves an automatic system snapshot.

```bash
0 * * * * /bin/bash /home/janu/linux_project/sysdash/main.sh --cron >> /home/janu/linux_project/sysdash/logs/cron.log 2>&1
```

## Commands Used

`uname`, `whoami`, `who`, `uptime`, `df -h`, `du -sh`, `ps`, `date`, `tar`, `cron`.

## What I Learned

I learned how to use Linux system commands, create Bash functions, manage directories and files, save system snapshots, create compressed backups, maintain logs, and schedule automatic tasks using crontab.

## Project Guide

This project was completed under the guidance of:

**Dr. Anjum Y. Mansuri**  
Assistant Professor, Computer Applications  
LJ Institute of Computer Applications, LJ University, Ahmedabad.

GitHub: [@anjum-mansuri](https://github.com/anjum-mansuri)
