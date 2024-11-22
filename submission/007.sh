# Only one single output remains unspent from block 123,321. What address was it sent to?
block=$(bitcoin-cli getblock $(bitcoin-cli getblockhash  123321) 2 | jq  --raw-output .tx[].txid)

for txid in $block
do
    outcount=$(bitcoin-cli getrawtransaction $txid true | jq '.vout | length')
    for index in $(seq 0 $(($outcount-1)) )
    do
        echo $(bitcoin-cli gettxout $txid $index | jq -r '.scriptPubKey.address' )
    done
done
