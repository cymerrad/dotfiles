#!/bin/bash
systemd-inhibit --what=handle-lid-switch `dirname $0`/watch-lid-switch.sh
