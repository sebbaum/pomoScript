#!/bin/bash

source config.sh

### Running pomodoro
echo "${BUSY_NOTIFICATION}"
spd-say -i ${SOUND_VOLUME} "${BUSY_SOUND}"
if [ $NOTIFICATIONS_ENABLED ]
	then
	notify-send "${BUSY_NOTIFICATION}"
fi

if [ $SLACK_DND_ENABLED ]
	then
	curl --request GET --url "${DND_URL}?token=${SLACK_TOKEN}&num_minutes=${POMODORO_TIME}" --header 'cache-control: no-cache' --header 'content-type: application/json' &> /dev/null
fi

if [ $BLINK1_ENABLED ]
	then
	${BLINK1_BIN} --${BUSY_COLOR} > /dev/null
fi

COUNTER=0
POMODORO_TIME_SEC=$((${POMODORO_TIME}*60))
while [ ${COUNTER} -le ${POMODORO_TIME_SEC} ]; do
	sleep 1
	let REMAINING=${POMODORO_TIME_SEC}-${COUNTER}
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
DEFAULT_BREAK_TIME_SEC=$((${DEFAULT_BREAK_TIME}*60))
while [ ${COUNTER} -le ${DEFAULT_BREAK_TIME_SEC} ]; do
	sleep 1
	let REMAINING=${DEFAULT_BREAK_TIME_SEC}-${COUNTER}
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