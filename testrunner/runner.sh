#!/usr/bin/env bash
#clean-up
rm -rf output
#download all content of specified page to disc
wget -H -k -K -P output -p $1
#get used disc space in bytes of previously downloaded content
size=`du -bs output | grep -o '[[:digit:]]*'`
#get current timestamp in nanoseconds
date=`date +%s%N`
#write data to influxdb
#https://docs.influxdata.com/influxdb/v1.4/guides/writing_data/
#to demonstrate how annotations works we can pass second parameter (optional) to this script
if [ -n "$3" ]; then
    curl -i -XPOST 'http://influxdb:8086/write?db=testdatadb' --data-binary "site_size,site=$1 comment=\"$2\",tags=\"$3\",value=$size $date"
elif [ -n "$2" ]; then
    curl -i -XPOST 'http://influxdb:8086/write?db=testdatadb' --data-binary "site_size,site=$1 comment=\"$2\",value=$size $date"
else
    curl -i -XPOST 'http://influxdb:8086/write?db=testdatadb' --data-binary "site_size,site=$1 value=$size $date"
fi
