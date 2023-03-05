#!/bin/bash

sequence_path="/root/nibiru/quests/sequence"
source <(curl -s https://raw.githubusercontent.com/ch-und/NibiruNode/main/functions.sh)

redelegate_arr[0]="nibivaloper1s4xk8sq06e0jpf4uf2xatwfsx8vg5sr03jm297"
redelegate_arr[1]="nibivaloper1khwntys59nwxl906p8rl68ky3d5tzuk776mts9"
redelegate_arr[2]="nibivaloper1pnqhamqueyjpcc9yrg0a66exz6hjvat9gjvkr9"
redelegate_arr[3]="nibivaloper1vnr2ek0x8f0g9cqurzm9nhhcmdagfe0fh77k3u"
redelegate_arr[4]="nibivaloper1rkavq8n08wmjxhvsmpgsxc9xdjsragn0z09sv8"
redelegate_arr[5]="nibivaloper1kr0pqvphjwvau578m53ps8llaym0swp4dljmee"
redelegate_arr[6]="nibivaloper1p5n4cfajhwf5xpemc3zxad3nwsy267nxqtlyw2"
redelegate_arr[7]="nibivaloper1gc6vpl9j0ty8tkt53787zps9ezc70kj8wv386g"
redelegate_arr[8]="nibivaloper1vnr2ek0x8f0g9cqurzm9nhhcmdagfe0fh77k3u"
redelegate_arr[9]="nibivaloper19v87lysa6jk6wrw0xlfh7y92czz7gnxyuw9uj4"
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