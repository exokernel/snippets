#!/bin/bash

ssh_list=()

while IFS= read -r ssh_entry; do
    ssh_list+=("$ssh_entry")
done

sync=false

while getopts "s" option; do
    case "$option" in
        s)
            sync=true
            ;;
        *)
            ;;
    esac
    shift
done

split_list=()
for ssh_ip in "${ssh_list[@]:1}"; do
    split_list+=("split-pane" "ssh $ssh_ip" ";")
    split_list+=("select-layout" "tiled" ";")
done

if [ $sync == true ]; then
    tmux new-session -d -s bcmux "ssh ${ssh_list[0]}" ';' \
        "${split_list[@]}" \
        set-option -w synchronize-panes
else
    tmux new-session -d -s bcmux "ssh ${ssh_list[0]}" ';' \
        "${split_list[@]}"
fi

echo "created tmux session named bcmux; run 'tmux at -t bcmux' to attach"
echo list of sessions
tmux ls
