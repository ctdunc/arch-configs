export DESKTOP_BACKGROUND=$HOME/desktop-backgrounds/arch-bg.jpg
feh --bg-scale $DESKTOP_BACKGROUND

xsetwacom --set 'Wacom Pen and multitouch sensor Finger touch' Touch off
compton --backend xrender & dropbox & xbindkeys &
exec i3

