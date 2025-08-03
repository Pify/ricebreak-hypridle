#!/bin/bash

if [ "$XDG_CURRENT_DESKTOP" != "Hyprland" ]; then
  exit 0
fi

while ! systemctl --user is-system-running --quiet 2>/dev/null; do
    sleep 1
done

if ! systemctl --user is-active --quiet ricebreak.service; then
    systemctl --user start ricebreak.service
    espeak "Rice guardian has awakened."
    echo "✅ [$(date)] ricebreak.service started from Hyprland" >> ~/.local/share/ricebreak.log
else
    echo "⚠️ [$(date)] ricebreak.service already active — skipping" >> ~/.local/share/ricebreak.log
fi
