# 🌾 ricebreak — Hyprland-Only Meme Break Daemon

**ricebreak** is your chaotic Zen master — a custom systemd break reminder that runs **only inside Hyprland**, warns you if you overwork, and may unleash fullscreen JUMPSCAREs (unless you’re in a meeting).

Now powered by **Hypridle**, the Wayland-native idle detection daemon.

---

## 📋 Features

- ✅ **Runs only inside Hyprland**
- ✅ **Idle-aware** via `hypridle` (no need for xprintidle)
- ✅ Warns you when overworked via espeak and notify-send
- ✅ Plays meme video (optional) unless you’re in a meeting
- ✅ Respects GNOME session — doesn't run there
- ✅ Easy to install and configure

---

## 🗂️ File Structure

| Path | Description |
|------|-------------|
| `~/.config/breakscript/rice-overwork-check.sh` | Main script triggered by Hypridle |
| `~/.config/breakscript/insults.txt` | Random insults to keep you humble |
| `~/.config/systemd/user/ricebreak.service` | Optional persistent background service (not required with hypridle) |
| `~/.config/breakscript/start-rice-daemon.sh` | Starts service (optional) |
| `~/.config/hypr/hypridle.conf` | Hypridle config that triggers the break script |

---

## 📦 Dependencies

Install the following tools:

```bash
sudo dnf copr enable solopasha/hyprland
sudo dnf install hypridle espeak mpv
