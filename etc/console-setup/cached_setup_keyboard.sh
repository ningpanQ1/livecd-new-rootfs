#!/bin/sh

if [ -f /run/console-setup/keymap_loaded ]; then
    rm /run/console-setup/keymap_loaded
    exit 0
fi
kbd_mode '-u' 
loadkeys '/tmp/tmpkbd.qf8vXf' > '/dev/null' 
