# 📂 Script_Backup_Automated

**A lightweight Bash script for automated file backups with logging, error handling, and desktop notifications.**

This repository provides a simple, efficient Bash script to automate file backups from a source directory to a local backup destination. It uses `rsync` for reliable file synchronization, logs operations with timestamps, and sends desktop notifications to inform you of the backup status.

---

## 🚀 Features

- **Automated Backups**: Syncs files using `rsync` for speed and reliability.  
- **Detailed Logging**: Tracks success or failure in `backup.log` with timestamps.  
- **Desktop Notifications**: Displays a notification after each backup attempt.  
- **Error Handling**: Validates backup operations and logs issues.  
- **Customizable**: Easily adjust source and backup paths.  
- **Lightweight**: Minimal dependencies for Linux environments.  

---

## 📋 Table of Contents

- [Overview](#overview)  
- [Prerequisites](#prerequisites)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Script Breakdown](#script-breakdown)  
- [Log Output](#log-output)  
- [Customization](#customization)  
- [Contributing](#contributing)  
- [License](#license)  

---

## 📖 Overview

`Script_Backup_Automated` simplifies file backups by automating the process of copying files from a source directory (`/home/kali/Desktop/New_Backup`) to a local backup directory (`/home/kali/Desktop/Backup`).  

It leverages `rsync` for efficient file transfers, logs every operation in a `backup.log` file, and sends desktop notifications to keep you informed. This script is perfect for users needing a reliable, user-friendly backup solution.

---

## 🛠 Prerequisites

Before running the script, ensure you have:  

- **Operating System**: Linux (tested on Kali Linux).  
- **Dependencies**:  
  - `bash`: Required to run the script.  
  - `rsync`: Used for file synchronization.  
  - `libnotify-bin`: Required for desktop notifications (`notify-send`).  
- **Permissions**: Read/write access to source and backup directories.  

To install dependencies on Debian-based systems:  
```bash
sudo apt update
sudo apt install rsync libnotify-bin
```

---

## 🔧 Installation

Follow these steps to set up the script:  

1. **Clone the Repository**:  
   ```bash
   git clone https://github.com/your-username/Script_Backup_Automated.git
   cd Script_Backup_Automated
   ```

2. **Set Execute Permissions**:  
   ```bash
   chmod +x backup.sh
   ```

3. **Verify Paths**:  
   - Update `source` and `local_backup_dir` in `backup.sh` to match your directories.

---

## ▶️ Usage

### Run Manually  
Execute the script directly:  
```bash
./backup.sh
```

A desktop notification will appear indicating whether the backup succeeded or failed.

### Schedule with Cron  
Automate daily backups (e.g., at midnight):  
1. Open the crontab editor:  
   ```bash
   crontab -e
   ```  
2. Add this line:  
   ```bash
   0 0 * * * /path/to/Script_Backup_Automated/backup.sh
   ```

> **Note**: Notifications may not appear when running via `cron` unless your system is configured to allow them (e.g., setting `DISPLAY=:0`).

---

## 💻 Script Breakdown

Here’s the complete Bash script (`backup.sh`):  

```bash
#!/bin/bash

# Variables
source="/home/kali/Desktop/New_Backup"
log_situation="backup.log"
local_backup_dir="/home/kali/Desktop/Backup"

# Function
perform_backup(){
  rsync -avz /home/kali/Desktop/Backup /home/kali/Desktop/New_Backup > "$log_situation" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "backup successful :$(date)" >> "$log_situation"
    notify-send "Backup Status" "Backup completed successfully" -t 5000
  else
    echo "backup failed :$(date)" >> "$log_situation"
    notify-send "Backup Status" "Backup failed" -t 5000 -u critical
  fi
}

# Run the backup
perform_backup
```

### How It Works  

- **Variables**:  
  - `source`: Directory containing files to back up.  
  - `log_situation`: Log file for backup status.  
  - `local_backup_dir`: Destination for backups.  

- **Function**:  
  - `perform_backup`: Runs `rsync` with `-avz` (archive, verbose, compress).  
  - Checks `rsync` exit status (`$?`) to log success or failure.  
  - Sends a desktop notification using `notify-send`:  
    - Success: "Backup completed successfully" (5-second duration).  
    - Failure: "Backup failed" (critical urgency, 5-second duration).  

- **Execution**:  
  - Calls `perform_backup` to start the backup process.  

> **Note**: The script syncs from `local_backup_dir` to `source`. To back up from `source` to `local_backup_dir`, modify the `rsync` command:  
> ```bash
> rsync -avz "$source" "$local_backup_dir" > "$log_situation" 2>/dev/null
> ```

---

## 📜 Log Output

The script generates a `backup.log` file with entries like:  
```
backup successful :Sat May 10 12:34:56 UTC 2025
backup failed :Sat May 10 12:35:10 UTC 2025
```

Check this file to monitor backup history and troubleshoot issues.

---

## ⚙️ Customization

To tailor the script:  

1. **Change Directories**:  
   - Edit `source` and `local_backup_dir` in `backup.sh`.  

2. **Modify rsync Options**:  
   - Add flags like `--delete` to remove files not in the source.  

3. **Customize Notifications**:  
   - Adjust the notification text or duration in the `notify-send` commands.  

4. **Add Cloud Backup**:  
   - Extend the script to upload backups to cloud storage (e.g., AWS S3, Google Drive) using tools like `rclone`.  

Example for reversing backup direction:  
```bash
rsync -avz "$source" "$local_backup_dir" > "$log_situation" 2>/dev/null
```

---

## 🤝 Contributing

We welcome contributions! To contribute:  

1. Fork the repository.  
2. Create a feature branch:  
   ```bash
   git checkout -b feature/your-feature
   ```  
3. Commit changes:  
   ```bash
   git commit -m "Add your feature"
   ```  
4. Push to the branch:  
   ```bash
   git push origin feature/your-feature
   ```  
5. Open a Pull Request.  

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**Built with 💻 by Sally Gamal.**  
**Connect with me on [LinkedIn](https://www.linkedin.com/in/sally-gamal/).**