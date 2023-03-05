#!/bin/bash

sequence_path="/root/nibiru/quests/sequence"
source <(curl -s https://raw.githubusercontent.com/ch-und/NibiruNode/main/functions.sh)

redelegate_arr[0]="nibivaloper1s4xk8sq06e0jpf4uf2xatwfsx8vg5sr03jm297"
redelegate_arr[1]="nibivaloper1khwntys59nwxl906p8rl68ky3d5tzuk776mts9"
redelegate_arr[2]="nibivaloper1pnqhamqueyjpcc9yrg0a66exz6hjvat9gjvkr9"
redelegate_arr[3]="nibivaloper1vnr2ek0x8f0g9cqurzm9nhhcmdagfe0fh77k3u"
redelegate_arr[4]="nibivaloper195w5wxp8hgqgz7schdukq7u5kadc2tnrsc00a0"
redelegate_arr[5]="nibivaloper1e04un8tgxe9zm5630jg08p0uf5x024lp79t4u8"
redelegate_arr[6]="nibivaloper1gz79ft45w335xg0p0fst8nlz30clwadclr5uwy"
redelegate_arr[7]="nibivaloper1e04un8tgxe9zm5630jg08p0uf5x024lp79t4u8"
redelegate_arr[8]="nibivaloper15t60ugdvgsapkp779h4eanx0jjcef9vkva8m34"
redelegate_arr[9]="nibivaloper15xa3kcsq8mnvv6lqsgtaa7kmhl6938lm2se8an"
redelegate_arr[10]="nibivaloper1xt7q9pd4m3mp50kxzj9wsuu7t2xmlgvc66d5m3"

printHeader

for i in 1 2 3 4
do
    size=${#redelegate_arr[@]}
    index=$(($RANDOM % $size))
    rele_wallet=${redelegate_arr[$index]}

    delegateTo $rele_wallet
    redelegateTo $rele_wallet
done 
delegateYourself
claimRewards