NC="\e[0m"           # no color
CYAN="\e[1m\e[1;96m" # cyan color
RED="\e[1m\e[1;91m" # red color
faucet_url="https://faucet.itn-1.nibiru.fi/"
wallet_address=$(nibid keys show wallet -a)
valoper_address=$(nibid keys show wallet --bech val -a)


function printLine {
  echo "---------------------------------------------------------------------------------------"
}

function printCyan {
  echo -e "${CYAN}${1}${NC}"
}

function printRed {
  echo -e "${RED}${1}${NC}"
}

function addToPath {
  source $HOME/.bash_profile
  PATH_EXIST=$(grep ${1} $HOME/.bash_profile)
  if [ -z "$PATH_EXIST" ]; then
    echo "export PATH=$PATH:${1}" >>$HOME/.bash_profile
  fi
}

function printHeader {
    printLine
    echo -e "Wallet:            ${CYAN}$wallet_address${NC}"
    echo -e "Validator:         ${CYAN}$valoper_address${NC}"
    printLine && sleep 1
}

function faucet {
    printCyan "Faucet" && sleep 1
    curl -X POST -d '{"address": "'"$wallet_address"'", "coins": ["110000000unibi","1000000000unusd","1000000000uusdt"]}' $faucet_url
}

function claimRewards {
    printLine
    printCyan "Withdraw to $wallet_address" && sleep 2
    nibid tx distribution withdraw-all-rewards --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -y
}

function delegateYourself {
    printLine
    printCyan "Delegate to my/your validator" && sleep 2
    nibid tx staking delegate $(nibid keys show wallet --bech val -a) 100000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -y 
}

function delegateTo {
    printLine
    printCyan "Delegate to other validator" && sleep 2
    nibid tx staking delegate ${1} 1000000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -y
}

function redelegateTo {
    printLine
    printCyan "Redele to other validator: ${1}"
    nibid tx staking redelegate $(nibid keys show wallet --bech val -a) ${1} 1000000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -y
}