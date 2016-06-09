#!/bin/sh

COMMAND="mpv --no-video --volume=80 /home/krompus/bin/goddess/fairyfountainext.webm"
RUNNING=$(pgrep -f "$COMMAND") 
                                        
if [ "$RUNNING" -gt 1 ]
then
    pkill -f "$COMMAND"
else
    $COMMAND
fi
