#!/bin/bash
_lid_action() {
    xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-battery $@
}
_value=`_lid_action`
_lid_action -s $(( ! $_value ))

notify-send "Lid close value: `_lid_action`"
