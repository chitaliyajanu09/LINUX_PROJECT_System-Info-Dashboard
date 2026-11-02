#!/bin/bash
# lib/functions.sh – all functions for System Info Dashboard
DATA="data/snapshots"

LOG="logs/activity.log"

# write one line to the activity log
log() {
    echo "$(date) | $*" >> "$LOG"
}

# check the data file / folder exists before using it
check_data() {
    if [ ! -e "$DATA" ]; then
        echo "Data not found: $DATA"
        return 1
    fi
}

show_help() {
    echo "Usage: ./main.sh            -> open the menu"
    echo "       ./main.sh --help     -> show this help"
    echo "       ./main.sh --backup   -> backup data/ now"
    echo "       ./main.sh --cron     -> run the scheduled (crontab) task"
}

view_data() {
    check_data || return
    if [ -d "$DATA" ]; then ls -l "$DATA"; else cat -n "$DATA" | more; fi
}

do_backup() {
    f="backups/data_$(date +%Y%m%d).tar.gz"
    tar -czf "$f" data/
    echo "Backup saved: $f ($(du -h "$f" | cut -f1))"
    log "backup created $f"
}

view_log() {
    if [ -f "$LOG" ]; then tail -n 15 "$LOG"; else echo "No activity yet."; fi
}

# FEATURE 1: Show OS and kernel info (uname -a) and current user (whoami)
feature_1() {
    echo "===== SYSTEM INFORMATION ====="

    echo "Operating System and Kernel:"
    uname -a

    echo ""
    echo "Current User:"
    whoami

    log "feature_1 used"
}

# FEATURE 2: Show logged-in users (who) and uptime
feature_2() {
    echo "===== LOGGED-IN USERS ====="

    if [ -n "$(who)" ]; then
        who
    else
        echo "Current Linux user: $(whoami)"
    fi

    echo ""
    echo "===== SYSTEM UPTIME ====="
    uptime

    log "feature_2 used"
}
# FEATURE 3: Show disk usage (df -h) and folder size (du -sh)
feature_3() {
    echo "===== DISK USAGE ====="
    df -h

    echo ""
    echo "===== SNAPSHOTS FOLDER SIZE ====="
    du -sh "$DATA"

    log "feature_3 used"
}

# FEATURE 4: Show the top 5 processes by memory (ps --sort)

feature_4() {
    echo "===== TOP 5 PROCESSES BY MEMORY ====="
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    log "feature_4 used"
Submission Date}


# FEATURE 5: Save a full snapshot to snapshots/ with the date
feature_5() {
    mkdir -p "$DATA"

    local snapshot="$DATA/snapshot.txt"

    {
        echo "===== SYSTEM SNAPSHOT ====="
        echo "Date: $(date)"
        echo ""
        echo "===== OPERATING SYSTEM ====="
        uname -a
        echo ""
        echo "===== CURRENT USER ====="
        whoami
        echo ""
        echo "===== SYSTEM UPTIME ====="
        uptime
        echo ""
        echo "===== DISK USAGE ====="
        df -h
        echo ""
        echo "===== TOP 5 PROCESSES BY MEMORY ====="
        ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    } > "$snapshot"

    echo "Snapshot saved successfully!"
    echo "File: $snapshot"
    log "feature_5 used"
}


# CRON TASK: Every hour, save a system snapshot to snapshots/

cron_task() {
    mkdir -p "$DATA" reports

    local snapshot="$DATA/cron_snapshot.txt"

    {
        echo "===== AUTOMATIC SYSTEM SNAPSHOT ====="
        echo "Date: $(date)"
        echo ""
        echo "===== SYSTEM INFORMATION ====="
        uname -a
        echo ""
        echo "===== CURRENT USER ====="
        whoami
        echo ""
        echo "===== SYSTEM UPTIME ====="
        uptime
        echo ""
        echo "===== DISK USAGE ====="
        df -h
        echo ""
        echo "===== TOP 5 PROCESSES BY MEMORY ====="
        ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    } > "$snapshot"

    echo "$(date) snapshot saved: $snapshot" >> reports/cron_output.txt

    log "cron task ran"
    echo "Automatic snapshot saved successfully!"
    echo "File: $snapshot"
}

# CRON TASK: Every hour, save a system snapshot to snapshots/
cron_task() {
    mkdir -p "$DATA" reports

    local snapshot="$DATA/cron_snapshot.txt"

    {
        echo "===== AUTOMATIC SYSTEM SNAPSHOT ====="
        echo "Date: $(date)"
        echo ""
        echo "===== SYSTEM INFORMATION ====="
        uname -a
        echo ""
        echo "===== CURRENT USER ====="
        whoami
        echo ""
        echo "===== SYSTEM UPTIME ====="
        uptime
        echo ""
        echo "===== DISK USAGE ====="
        df -h
        echo ""
        echo "===== TOP 5 PROCESSES BY MEMORY ====="
        ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    } > "$snapshot"

    echo "$(date) snapshot saved: $snapshot" >> reports/cron_output.txt
}


