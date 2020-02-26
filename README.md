# asusMerlin

With the custom builds of the Asus Merlin code, there seems to be a small gap in being able to
montor the devices.  The following scripts allow for getting client and AP information
beyond what SNMP gives.

## tutorial:
This will auto-create crontab entry

* https://www.cyberciti.biz/faq/how-to-add-cron-job-on-asuswrt-merlin-wifi-router/




## man page to use for commands with wl
Found what I cared about from:

The forward script itself uses wl to get metrics to forward

https://wiki.dd-wrt.com/wiki/index.php/Wl_command

## note:
There is no bash on the router, so I tried to keep this as simple as possible

Merlin has internal to it:
curl, wc, grep, sed, awk, hostname, crond, nc

Remember: that some binaries do not have all the normal options (IE nc)
