#!/bin/bash

xautolock -toggle > /dev/null 2>&1 && \
notify-send "Xautolock Toggled" "Resume in 60 minutes" && \
(sleep 60m && xautolock -toggle > /dev/null 2>&1) &

