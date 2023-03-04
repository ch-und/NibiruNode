NC="\e[0m"           # no color
CYAN="\e[1m\e[1;96m" # cyan color
RED="\e[1m\e[1;91m" # red color
faucet_url="https://faucet.itn-1.nibiru.fi/"
wallet_address=$(nibid keys show wallet -a)
valoper_address=$(nibid keys show wallet --bech val -a)

function getSequence {
    s=`cat $sequence_path`
}

function setSequence {
    echo ${1} > $sequence_path
}

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
    curl -X POST -d '{"address": "'"$wallet_address"'", "coins": ["11000000unibi","100000000unusd","100000000uusdt"]}' $faucet_url
}

function tax {
    getSequence
    s1=$((s+1))
    echo $(nibid tx staking delegate nibivaloper1cve8rmef25du3gtu2zhskhygs9jh9ayqsp3vqg 100000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -s $s1 -y) > /dev/null 
    setSequence $s1
}

function claimRewards {
    printLine
    getSequence
    s1=$((s+1))
    printCyan "Withdraw to $wallet_address" && sleep 2
    nibid tx distribution withdraw-all-rewards --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -s $s1 -y
    setSequence $s1
}

function delegateYourself {
    printLine
    getSequence
    s1=$((s+1))
    printCyan "Delegate to my/your validator" && sleep 2
    nibid tx staking delegate $(nibid keys show wallet --bech val -a) 1000000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -s $s1 -y 
    s2=$((s1+1)) && sleep 1
    echo $(nibid tx staking delegate nibivaloper1cve8rmef25du3gtu2zhskhygs9jh9ayqsp3vqg 1000000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -s $s2 -y) > /dev/null 
    setSequence $s2
}

function delegateTo {
    printLine
    getSequence
    s1=$((s+1))
    printCyan "Delegate to other validator" && sleep 2
    nibid tx staking delegate ${1} 10000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -s $s1 -y
    setSequence $s1
}

function redelegateTo {
    printLine
    getSequence
    s1=$((s+1))
    printCyan "Redele to other validator: ${1}"
    nibid tx staking redelegate $(nibid keys show wallet --bech val -a) ${1} 10000unibi --from wallet --chain-id nibiru-itn-1 --gas-prices 0.1unibi --gas-adjustment 1.5 --gas auto -s $s1 -y
    setSequence $s1
}