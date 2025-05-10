# 🔄 Linux Backup Script using rsync

This project contains a simple yet effective Bash script that automates the backup of a local directory using the `rsync` tool. It includes logging to track the success or failure of each backup operation.

---

## 📜 Overview

The script performs the following tasks:

- Backups the directory `/home/sally/Documents/`
- Stores the backup in the local directory `~/Bakups`
- Logs the result (success/failure) in `backup.log`

---

## 📁 Project Structure


---

## ⚙️ How It Works

1. Uses `rsync -avz` to synchronize files:
   - `-a`: Archive mode (preserves permissions, timestamps, etc.)
   - `-v`: Verbose output
   - `-z`: Compress files during transfer
2. Checks if the backup was successful using the exit code `$?`
3. Appends a log entry with a timestamp in `backup.log`

---

## 🔧 Script Variables

| Variable           | Description                                                       |
|--------------------|-------------------------------------------------------------------|
| `source`           | Source folder to back up (e.g., `/home/sally/Documents/`)         |
| `log_situation`    | Log file name for backup results (`backup.log`)                   |
| `local_backup_dir` | Destination backup folder (e.g., `~/Bakups`)                      |

---

## 🚀 Setup & Usage

1. Make sure `rsync` is installed:
   ```bash
   sudo apt update
   sudo apt install rsync
   nano backup_script.sh
---
#!/bin/bash

# Variables
source="/home/sally/Documents/"
log_situation="backup.log"
local_backup_dir="$HOME/Bakups"

# Create backup directory if not exists
mkdir -p "$local_backup_dir"

# Function to perform backup
perform_backup() {
    rsync -avz "$source" "$local_backup_dir" > "$log_situation" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Backup successful : $(date)" >> "$log_situation"
    else
        echo "Backup failed : $(date)" >> "$log_situation"
    fi
}

# Run the backup
perform_backup

---
Save and exit, then make it executable:

bash
Copy
Edit
chmod +x backup_script.sh
Run the script:

bash
Copy
Edit
./backup_script.sh
🕒 Automate with Cron
To run the backup automatically every day at 8 PM:

Open the crontab:

bash
Copy
Edit
crontab -e
Add this line:

bash
Copy
Edit
0 20 * * * /full/path/to/backup_script.sh
Replace /full/path/to/backup_script.sh with the actual file path.

📝 Notes
The destination folder ~/Bakups will be created if it does not exist.

Each time the script runs, it appends the log with the current date and status.

You can customize the source and local_backup_dir values easily.

👨‍💻 Author
Sally Gamal
Ai Enginner


