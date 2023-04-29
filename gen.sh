#!/bin/sh
mkdir -p ./tmp
cd ./tmp

wget --no-check-certificate -c -O raw.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt

{
echo "/ip firewall address-list"

for net in $(cat raw.txt) ; do
  echo "add list=fal-chn address=$net comment=chnroute"
done

echo "add list=fal-chn address=172.16.68.0/24 comment=chnroute"
echo "add list=fal-chn address=172.16.69.0/24 comment=chnroute"

} > ../chnroute.rsc

cd ..
rm -rf ./tmp
