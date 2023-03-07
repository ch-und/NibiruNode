# NibiruNode

## Chạy lần đầu
`mkdir "/root/nibiru/quests" && cd /root/nibiru/quests`

Chạy thử lệnh
`nibid tx staking delegate $(nibid keys show wallet --bech val -a) 10000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -y `
Xem thử chỗ account sequence mismatch, expected là bao nhiêu, thì lấy số sequence -1
Ví dụ expected 10 => lấy 9
`echo 9 > "/root/nibiru/quests/sequence"`

Tải file về
`curl -o nibi_faucet.sh https://raw.githubusercontent.com/ch-und/NibiruNode/main/nibi_faucet.sh && sudo chmod +x nibi_faucet.sh`
`curl -o nibi_quests.sh https://raw.githubusercontent.com/ch-und/NibiruNode/main/nibi_quests.sh && sudo chmod +x nibi_quests.sh`


Faucet:
`bash /root/nibiru/quests/nibi_faucet.sh`
Làm nhiệm vụ:
`bash /root/nibiru/quests/nibi_quests.sh`

## Update script mới

`cd /root/nibiru/quests && rm -f nibi_quests.sh && curl -o nibi_faucet.sh https://raw.githubusercontent.com/ch-und/NibiruNode/main/nibi_faucet.sh && sudo chmod +x nibi_faucet.sh && curl -o nibi_quests.sh https://raw.githubusercontent.com/ch-und/NibiruNode/main/nibi_quests.sh && sudo chmod +x nibi_quests.sh`