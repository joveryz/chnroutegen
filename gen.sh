#!/bin/sh
mkdir -p ./tmp
cd ./tmp

wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=fal-chn address=$net comment=chnroute"
done

} > ../chnroute.rsc

cd ..
rm -rf ./tmp
