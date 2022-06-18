#!/bin/sh
killall conky
sleep 5
# conky -q -c ~/.config/conky/weather.conf &
conky -q -c ~/.config/conky/todo.conf & exit
