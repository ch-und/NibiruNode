#!/bin/bash

sequence_path="/root/nibiru/quests/sequence"
source <(curl -s https://raw.githubusercontent.com/ch-und/NibiruNode/main/functions.sh)

redelegate_arr[0]="nibivaloper1cve8rmef25du3gtu2zhskhygs9jh9ayqsp3vqg"
redelegate_arr[1]="nibivaloper1z8n976hk4upvw4z53q0j0jeyquqmvwmcju4hru"
redelegate_arr[2]="nibivaloper13yal4vn6gn6lax59je87gtmy7j2h8738pdw97l"
redelegate_arr[3]="nibivaloper1lgnfa0xvppkxnudkqfz6q3wf7tv6c63u9g55gf"
size=${#redelegate_arr[@]}
index=$(($RANDOM % $size))
rele_wallet=${redelegate_arr[$index]}

printHeader
faucet
claimRewards
delegateYourself
delegateTo $rele_wallet
redelegateTo $rele_wallet