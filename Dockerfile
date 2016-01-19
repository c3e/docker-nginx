FROM ubuntu:14.04

MAINTAINER NGINX Docker Maintainers "van"

RUN apt-get update
RUN apt-get install -y ca-certificates nginx
RUN apt-get install -y php5-common php5-cli php5-fpm curl

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY startup.sh /root/
RUN chmod +x /root/startup.sh

EXPOSE 80 443

CMD ["/root/startup.sh"]
