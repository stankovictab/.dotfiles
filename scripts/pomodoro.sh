echo 'A 20 minute pomodoro session started.'
notify-send 'Pomodoro session started.'

sleep 1200

echo 'Pomodoro session ended.'
notify-send 'Pomodoro session ended.'
mpv --no-config --volume=70 ~/scripts/bell.mp3
