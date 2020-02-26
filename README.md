# asusMerlin

With the custom builds of the Asus Merlin code, there seems to be a small gap in being able to
montor the devices.  The following scripts allow for getting client and AP information
beyond what SNMP gives.

Following from tutorial:
https://www.cyberciti.biz/faq/how-to-add-cron-job-on-asuswrt-merlin-wifi-router/

This will auto-create crontab entry

The script itself to grab the metrics leverages wl
There is no bash on the router, so I tried to keep this as simple as possible

Found what I cared about from:
https://wiki.dd-wrt.com/wiki/index.php/Wl_command

Merlin has internal to it:
curl, wc, grep, sed, awk, hostname, crond, nc

Note that some binaries do not have all the normal options (IE nc)
