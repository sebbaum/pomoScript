#!/bin/bash

source config.sh

### Running pomodoro
echo "${BUSSY_NOTIFICATION}"
spd-say -i ${SOUND_VOLUME} "${BUSSY_SOUND}"
if [ $NOTIFICATIONS_ENABLED ]
	then
	notify-send "${BUSSY_NOTIFICATION}"
fi

if [ $BLINK1_ENABLED ]
	then
	sudo ${BLINK1_BIN} --${BUSSY_COLOR} > /dev/null
fi

sleep ${POMODORO_TIME}

### Taking a break
echo ${BREAK_NOTIFICATION}
if [ $NOTIFICATIONS_ENABLED ]
	then
	notify-send "${BREAK_NOTIFICATION}"
fi
spd-say -i ${SOUND_VOLUME} "${BREAK_SOUND}"
if [ $BLINK1_ENABLED ]
	then
	sudo ${BLINK1_BIN} --${BREAK_COLOR} > /dev/null
fi

sleep ${DEFAULT_BREAK_TIME}

### Beeing available
echo ${AVAILABLE_NOTIFICATION}
if [ $NOTIFICATIONS_ENABLED ]
	then
	notify-send "${AVAILABLE_NOTIFICATION}"
fi
spd-say -i ${SOUND_VOLUME} "${AVAILABLE_SOUND}"
if [ $BLINK1_ENABLED ]
	then
	sudo ${BLINK1_BIN} --${AVAILABLE_COLOR} > /dev/null
fi


exit 0