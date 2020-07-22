#!/usr/bin/env sh

# .xinitrc runs automatically when you run startx.

# Sources 
[ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"

# Start Window Manager
exec "$WM"
