#!/bin/sh

# Graphite destination host
G_HOST="192.168.15.193"
G_PORT="2003"

# Get the OAM IP address for this AP
LOCAL_HOST=$(hostname -i | sed 's/[.]/_/g')

# eth1 and 2 are the interfaces for the radios
for x in 1 2; do
  DATES=$(date +%s --utc)
  SSID=$(wl -i eth${x} ssid | awk '{print $NF}' | sed 's/"//g')
  CLIENT_COUNT=$(wl -i eth${x} assoclist | wc -l)
  RADIO_POWER=$(wl -i eth${x} pwr_percent)
  RADIO_NOISE_FLOOR=$(wl -i eth${x} noise)

  echo "wireless.${LOCAL_HOST}.ap.${SSID}.clients ${CLIENT_COUNT} ${DATES}" | nc -w 1 ${G_HOST}:${G_PORT}
  echo "wireless.${LOCAL_HOST}.ap.${SSID}.power ${RADIO_POWER} ${DATES}" | nc -w 1 ${G_HOST}:${G_PORT}
  echo "wireless.${LOCAL_HOST}.ap.${SSID}.noise_floor ${RADIO_NOISE_FLOOR} ${DATES}" | nc -w 1 ${G_HOST}:${G_PORT}

  CLIENT_LIST=$(wl -i eth${x} assoclist | awk '{print $2}')
  for y in ${CLIENT_LIST} ; do
    CLIENT_NAME=$(arp -a | grep ${y} | awk '{print $1}' | sed 's/[()]//g' | sed 's/[. ]/_/g')
    CLIENT_STRENGTH=$(wl -i eth${x} rssi ${y})
    if [ "${CLIENT_NAME}" = "" ];then
      CLIENT_NAME="${y}"
    fi
    echo "wireless.${LOCAL_HOST}.ap.${SSID}.client.${CLIENT_NAME}.rssi ${CLIENT_STRENGTH} ${DATES}" | nc -w 1 ${G_HOST}:${G_PORT}
  done
done
