FROM alpine

MAINTAINER william <william@10ln.com>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
	apk add --update darkhttpd
	
ADD start.sh /conf-copy/start.sh
RUN chmod +x /conf-copy/start.sh

WORKDIR /
EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/conf-copy/start.sh"]
