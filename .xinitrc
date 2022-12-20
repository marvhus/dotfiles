slstatus &

compton --config ~/.config/compton.conf -b &
nitrogen --restore &
dunst -font "Hack" -conf ~/.config/dunst/dunstrc &
~/screen.sh &
flameshot &

exec dwm > ~/.dwm.log
