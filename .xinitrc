export DESKTOP_BACKGROUND=$HOME/desktop-backgrounds/rocket.jpg
feh --bg-fill $DESKTOP_BACKGROUND

xsetwacom --set 'Wacom Pen and multitouch sensor Finger touch' Touch off
compton --backend xrender & dropbox & xbindkeys &
exec i3

