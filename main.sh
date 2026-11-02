#!/bin/bash
# main.sh – L100 System Info Dashboard
# Menu-driven shell script (while loop + case)
cd "$(dirname "$0")" || exit 1
source lib/functions.sh

case "$1" in
    --help)   show_help; exit 0 ;;
    --backup) do_backup; exit 0 ;;
    --cron)   cron_task; exit 0 ;;
esac

while true; do
    echo
    echo '========== SYSTEM INFO DASHBOARD =========='
    echo '1) Show OS and kernel info (uname -a) and current user (whoami)'
    echo '2) Show logged-in users (who) and uptime'
    echo '3) Show disk usage (df -h) and folder size (du -sh)'
    echo '4) Show the top 5 processes by memory (ps --sort)'
    echo '5) Save a full snapshot to snapshots/ with the date'
    echo "6) View data"
    echo "7) Backup data (tar.gz)"
    echo "8) View activity log"
    echo "0) Exit"
    read -p "Choose an option: " ch
    case "$ch" in
        1) feature_1 ;;
        2) feature_2 ;;
        3) feature_3 ;;
        4) feature_4 ;;
        5) feature_5 ;;
        6) view_data ;;
        7) do_backup ;;
        8) view_log ;;
        0) echo "Bye!"; break ;;
        *) echo "Invalid choice, try again." ;;
    esac
done
