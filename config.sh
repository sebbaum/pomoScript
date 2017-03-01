#!/bin/bash

POMODORO_TIME=$1

# Pomodoro time in minutes
DEFAULT_POMODORO_TIME=25

if [ $# -eq 0 ]
	then
	POMODORO_TIME=${DEFAULT_POMODORO_TIME}
fi


# Default config values


# Break time
DEFAULT_BREAK_TIME=1

# Sound volume (-100, 100)
SOUND_VOLUME="-50"
BUSY_SOUND="Starting new Pomodoro for ${POMODORO_TIME} minutes. Be focused. Be productive."
BREAK_SOUND="Pomodoro finished. Take a break for ${DEFAULT_BREAK_TIME} minutes now!"
AVAILABLE_SOUND="Break finished. Prepare for your collegues and project managers requests or start a new Pomodoro cycle."

# Enable blink1 status light (0 = enabled)
BLINK1_ENABLED=0

# Executuable for blink1
BLINK1_BIN="/home/seb/blink1/blink1-tool"

# COLORS
AVAILABLE_COLOR="green"
BREAK_COLOR="blue"
BUSY_COLOR="red"

# notifications

# enable notifications (0 = enabled)
NOTIFICATIONS_ENABLED=0

BUSY_NOTIFICATION="Pomodoro is running for ${POMODORO_TIME} minutes..."
BREAK_NOTIFICATION="Taking a break for ${DEFAULT_BREAK_TIME} minutes..."
AVAILABLE_NOTIFICATION="Available now..."

if [ -e slack.config.sh ]
	then
	source slack.config.sh
fi

