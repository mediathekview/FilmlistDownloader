FROM alpine

ENV OUTPUT_PATH=/tmp
ENV SERVER_URL=https://liste.mediathekview.de

RUN apk add xz wget

CMD echo "## STARTING FILMLIST DOWNLOAD" \
    && wget $SERVER_URL/Filmliste-akt.xz \
    && ls -l \
    && echo "## Filmlist downloaded, starting unpaking" \
    && unxz Filmliste-akt.xz \
    && ls -l \
    && echo "## Filmlist unpacked, copying to $OUTPUT_PATH" \
    && mv Filmliste-akt $OUTPUT_PATH/Filmliste-akt.json \
    && ls -l $OUTPUT_PATH \
    && echo "## FINISH \n" 