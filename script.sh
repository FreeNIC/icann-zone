#!/bin/bash

current_date_time="`date '+%Y-%m-%d (%H:%M)'`";

rm outputs/*

/usr/bin/wget -O outputs/root.zone https://www.internic.net/domain/root.zone
/bin/sed '/NSEC\|RRSIG\|DNSKEY\|SOA\|^\./d' < outputs/root.zone > outputs/root.include.zone

/usr/bin/git add --no-all .
/usr/bin/git commit -m "Auto update $current_date_time"
/usr/bin/git push origin master
