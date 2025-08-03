#!/bin/bash

# ----------- CONFIG ------------
WORK_THRESHOLD_MINUTES=60
STATE_FILE="$HOME/.cache/ricebreak/lastbreak"
JUMPSCARE_VIDEO="$HOME/Videos/rice_panic.mp4"
USE_VIDEO=false
INSULT_FILE="$HOME/.config/breakscript/insults.txt"
# ----------- /CONFIG -----------

mkdir -p "$(dirname "$STATE_FILE")"

is_meeting_active() {
    pgrep -f "zoom|teams|webex|meet.google.com|skype|jitsi|slack|discord" > /dev/null
}

now=$(date +%s)
last=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
elapsed=$(( (now - last) / 60 ))

INSULT=$(shuf -n 1 "$INSULT_FILE")

if [ "$elapsed" -ge "$WORK_THRESHOLD_MINUTES" ]; then
    espeak -v en-sc -s 210 -p 40 -a 200 "$INSULT"
    notify-send "PANIC MODE ENGAGED" "$INSULT"

    if [ "$USE_VIDEO" = true ] && [ -f "$JUMPSCARE_VIDEO" ]; then
        if is_meeting_active; then
            echo "[INFO $(date)] Skipped panic video — meeting app detected" >> ~/.local/share/ricebreak.log
        else
            mpv --fs --no-border "$JUMPSCARE_VIDEO" &
        fi
    fi
else
    espeak -v en-rp -s 120 -p 30 -a 180     "Dear Mortal, you’ve done well. Take a gentle break. Breathe. Blink. Walk a few steps."
    notify-send "Break Reminder" "Time for a gentle stretch, noble rice warrior."
fi

echo "$now" > "$STATE_FILE"
