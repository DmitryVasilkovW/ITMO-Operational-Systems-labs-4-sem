#!/bin/bash

show_changes=0

if [[ $1 == "-c" ]];
then
    show_changes=1
fi

home_dir=~/Desktop/ITMO-Operational-Systems-labs-4-sem/Labs/Lab4/task3
backup_dir=$home_dir/backups
last_backup_date=$(ls $backup_dir | grep -E "^Backup-" | sort -n | tail -1 | sed "s/Backup-//")
last_backup="$backup_dir/Backup-${last_backup_date}"
today=$(date +"%Y-%m-%d")
current_time=$(date -d "$today" +"%s")
last_backup_time=$(date -d "$last_backup_date" +"%s")
time_difference=$(echo "(${current_time} - ${last_backup_time}) / 60 / 60 / 24" | bc)
report_file=$home_dir/.backup-report

backup_created=0

if [[ $time_difference > 7 || -z "$last_backup_date" ]];
then
    mkdir "$backup_dir/Backup-${today}"
    
    for file in $(ls $home_dir/source);
    do
        cp "$home_dir/source/$file" "$backup_dir/Backup-$today"
    done
    
    file_list=$(ls $home_dir/source | sed "s/^/\t/")
    
    echo -e "${today}. Created:\n${file_list}" >> $report_file
    
    if [[ $show_changes == 1 ]];
    then
        echo -e "Created:\n${file_list}"
    fi
    
    backup_created=1
else
    changes=""
    
    for file in $(ls $home_dir/source);
    do
        if [[ -f "$last_backup/$file" ]];
        then
            source_size=$(wc -c "$home_dir/source/${file}" | awk '{print $1}')
            backup_size=$(wc -c "${last_backup}/${file}" | awk '{print $1}')
            size_difference=$(echo "${source_size} - ${backup_size}" | bc)
            
            if [[ $size_difference != 0 ]];
            then
                if [[ $show_changes == 1 ]];
                then
                    echo "Changes in $file:"
                    diff "$last_backup/$file" "$home_dir/source/$file"
                fi
                
                mv "$last_backup/$file" "$last_backup/$file.$today"
                cp "$home_dir/source/$file" $last_backup
                
                changes="${changes}\n\t$file ($file.$today)"
                
                backup_created=1
            fi
        else
            cp "$home_dir/source/$file" $last_backup
            
            changes="${changes}\n\t$file"
            
            backup_created=1
        fi
    done
    
    changes=$(echo $changes | sed 's/^\\n//')
    
    if [[ ! -z "$changes" ]];
    then
        echo -e "${last_backup_date}. Updated:\n${changes}" >> $report_file
        if [[ $show_changes == 1 ]]; 
        then
            echo -e "Updated:\n${changes}"
        fi
    elif [[ $show_changes == 1 ]];
    then
        echo "No changes detected."
    fi
fi

if [[ $backup_created == 1 ]];
then
    echo "Backup successfully created."
fi

