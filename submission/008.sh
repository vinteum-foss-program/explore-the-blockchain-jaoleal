# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
scriptsig=$(bitcoin-cli getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163 true | jq -r .vin[0].txinwitness[2])
address=$(bitcoin-cli decodescript "$scriptsig" | jq  '.asm | split(" ") | .[1]')
echo $address | jq -r
