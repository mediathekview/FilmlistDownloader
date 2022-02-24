FROM alpine

ENV OUTPUT_PATH=/tmp
ENV SERVER_URL=https://liste.mediathekview.de

RUN apk add xz wget

CMD wget $SERVER_URL/Filmliste-akt.xz \
    && unxz Filmliste-akt.xz \
    && mv Filmliste-akt $OUTPUT_PATH/Filmliste-akt.json