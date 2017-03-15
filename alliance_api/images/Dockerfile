# It is a dockerfile that is to build app alliance_api
# TODO: replace copy alliance_api to get from remote

FROM debian:jessie

WORKDIR /root/alliance_api

RUN mkdir bin && mkdir conf && mkdir logs && touch logs/alliance_api.log

COPY ./alliance_api /root/alliance_api/bin/

EXPOSE 8080

ENTRYPOINT ["./bin/alliance_api"]
