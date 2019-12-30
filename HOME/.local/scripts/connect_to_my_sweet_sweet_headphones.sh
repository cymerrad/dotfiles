#!/bin/bash
LOG_FILE=/tmp/sweet_sweet.log
SWEET_MAC="38:18:4C:2A:E5:14"

notify-send "Connecting to $SWEET_MAC"

coproc bluetoothctl
echo -e "connect $SWEET_MAC\n" >&"${COPROC[1]}"
sleep 3
echo -e 'exit\n' >&"${COPROC[1]}"
sleep 2
$LOG_FILE <&"${COPROC[0]}"
$LOG_FILE.err <&"${COPROC[3]}"

#notify-send "$(echo -e "$output")"
