# It is a dockerfile that is to build app alliance_api


FROM centos6.8:ssh

RUN mkdir -p /root/alliance_api
WORKDIR /root/alliance_api

RUN mkdir bin && mkdir conf && mkdir logs && touch logs/alliance_api.log

# 这里可以通过ADD命令从远程下载
COPY ./alliance_api /root/alliance_api/bin/

EXPOSE 8080

ENTRYPOINT ["./bin/alliance_api"]
