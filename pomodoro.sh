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
	${BLINK1_BIN} --${BUSSY_COLOR} > /dev/null
fi

COUNTER=0
while [ ${COUNTER} -le ${POMODORO_TIME} ]; do
	sleep 1
	let REMAINING=${POMODORO_TIME}-${COUNTER}
	echo -ne "${REMAINING} seconds remaining of Pomodoro.\r"
	let COUNTER=COUNTER+1
done
echo -ne "\n"

### Taking a break
echo ${BREAK_NOTIFICATION}
if [ $NOTIFICATIONS_ENABLED ]
	then
	notify-send "${BREAK_NOTIFICATION}"
fi
spd-say -i ${SOUND_VOLUME} "${BREAK_SOUND}"
if [ $BLINK1_ENABLED ]
	then
	${BLINK1_BIN} --${BREAK_COLOR} > /dev/null
fi

COUNTER=0
while [ ${COUNTER} -le ${DEFAULT_BREAK_TIME} ]; do
	sleep 1
	let REMAINING=${DEFAULT_BREAK_TIME}-${COUNTER}
	echo -ne "${REMAINING} seconds remaining of break.\r"
	let COUNTER=COUNTER+1
done
echo -ne "\n"

### Beeing available
echo ${AVAILABLE_NOTIFICATION}
if [ $NOTIFICATIONS_ENABLED ]
	then
	notify-send "${AVAILABLE_NOTIFICATION}"
fi
spd-say -i ${SOUND_VOLUME} "${AVAILABLE_SOUND}"
if [ $BLINK1_ENABLED ]
	then
	${BLINK1_BIN} --${AVAILABLE_COLOR} > /dev/null
fi


exit 0