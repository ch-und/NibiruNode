#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/ch-und/NibiruNode/main/functions.sh)

redelegate_arr[0]="nibivaloper1xmxdw8ean8jykqywr3x95q7jxq4zx77l0gmr4l"
redelegate_arr[1]="nibivaloper1pw7rz80zyvknqpea4lgdpwgckcjj2vrye02af3"
redelegate_arr[2]="nibivaloper1wpgzpd6lfrkzhufmujw5k770duwv8tly576k48"

printHeader

for i in 1 2 3 
do
    redele_wallet=${redelegate_arr[$i]}
    if [ $redele_wallet != $(nibid keys show wallet --bech val -a) ]
    then
        delegateTo $redele_wallet
        sleep 30
        redelegateTo $redele_wallet
        sleep 30
    fi
done 
delegateYourself
sleep 30
claimRewards
sleep 30