#!/bin/bash

#varibles

source="/home/sally/Documents/"
log_situation="backup.log"
local_backup_dir="~/Bakups"

#function

perform_backup(){
 rsync -avz /home/sally/Documents ~/bakups > "$log_situation" 2>/dev/null
  if  [ $? -eq 0 ];
   then
            echo "backup successful :$(date) " >> "$log_situation"
                    else
                                    echo "backup failed :$(date) "  >> "$log_situation"
                                     fi

          }

#Run the backup
perform_backup
