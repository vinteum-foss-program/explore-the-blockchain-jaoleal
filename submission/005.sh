# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
addr1=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 2 | jq --raw-output .vin[0].txinwitness[1])
addr2=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 2 | jq --raw-output .vin[1].txinwitness[1])
addr3=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 2 | jq --raw-output .vin[2].txinwitness[1])
addr4=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 2 | jq --raw-output .vin[3].txinwitness[1])
bitcoin-cli createmultisig 4 [\"$addr1\",\"$addr2\",\"$addr3\",\"$addr4\"] | jq --raw-output .address
