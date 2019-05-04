FROM golang:1-alpine

RUN apk add --no-cache bash git bitcoin && \
    apk --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
    --update add --no-cache leveldb leveldb-dev

RUN go get github.com/in3rsha/bitcoin-utxo-dump

WORKDIR /root/.bitcoin

ENTRYPOINT ["bitcoin-utxo-dump", "-f"]
CMD ["count,txid,vout,amount,type,address"]
