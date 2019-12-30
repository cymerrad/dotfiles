#!/bin/bash
LOG_FILE=/tmp/sweet_sweet.log
SWEET_MAC="38:18:4C:2A:E5:14"

notify-send "Disconnecting with $SWEET_MAC"

coproc bluetoothctl
echo -e "disconnect $SWEET_MAC\n" >&"${COPROC[1]}"
sleep 3
echo -e 'exit\n' >&"${COPROC[1]}"
sleep 2
$LOG_FILE <&"${COPROC[0]}"

#notify-send "$(echo -e "$output")"
