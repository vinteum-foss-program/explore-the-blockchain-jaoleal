# Which tx in block 257,343 spends the coinbase output of block 256,128?
coinbasetx=$(bitcoin-cli getblock $(bitcoin-cli getblockhash  256128) | jq  --raw-output .tx[0])
transaction=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 257343) 2 | jq --arg coinbasetx "$coinbasetx" '.tx[] | select(.vin[]?.txid == $coinbasetx)')
echo $transaction| jq --raw-output .txid
