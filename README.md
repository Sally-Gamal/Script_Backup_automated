# 📁 Backup Script

A simple Bash script that creates a backup of the user's `Documents` folder and saves it in a `bakups` folder inside the home directory. It also logs the status of the backup process.

---

## 🧠 Script Purpose

- Uses `rsync` to copy files from `/home/sally/Documents` to `~/bakups`.
- Logs whether the backup succeeded or failed in a file called `backup.log`.
- Can be run manually at any time.

---

## 📦 Requirements

- Linux, WSL, or any Bash-compatible environment.
- `rsync` must be installed (usually pre-installed on Linux systems).

---

## 🛠️ How to Use

1. Open the terminal.
2. Save the script in a file, for example: `backup.sh`.
3. Make the script executable:
   ```bash
   chmod +x backup.sh
