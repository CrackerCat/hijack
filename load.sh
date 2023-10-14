#!/bin/bash

if [[ $UID -ne 0 ]]; then
    echo must be root
    exit 1
fi

address=$(cat /proc/kallsyms | grep -E " sys_call_table$" | cut -d' ' -f1)
modprobe ./hijack.ko table=0x"$address"

dmesg | tail -5 | cut -c1-$COLUMNS
