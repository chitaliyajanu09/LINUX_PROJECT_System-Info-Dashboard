# L100 – System Info Dashboard

**Student:** JANU CHITALIYA | **Roll:** F09 | **Division:** G | **Enrollment:** 24004501210053

## Problem
Build a menu dashboard that shows system information and saves snapshots.

## Who will use it
Students learning system commands.

## Folder structure
- main.sh – menu (run with ./main.sh)
- lib/functions.sh – all functions
- data/ – data files
- reports/ – reports created by the script
- backups/ – tar.gz backups
- logs/ – activity.log and cron.log

## Features
1. Show OS and kernel info (uname -a) and current user (whoami)
2. Show logged-in users (who) and uptime
3. Show disk usage (df -h) and folder size (du -sh)
4. Show the top 5 processes by memory (ps --sort)
5. Save a full snapshot to snapshots/ with the date

## How to run
    cd ~/linux_project/sysdash
    ./main.sh
    ./main.sh --help

## Crontab task
Every hour, save a system snapshot to snapshots/

    0 * * * * /bin/bash $HOME/linux_project/sysdash/main.sh --cron >> $HOME/linux_project/sysdash/logs/cron.log 2>&1

## Commands used
uname, whoami, who, df -h, du -sh, ps, date

## What I learned
I learned how to use Linux system commands, create Bash functions, work with directories and files,
save system snapshots, create compressed backups, write logs, and schedule tasks using crontab.
