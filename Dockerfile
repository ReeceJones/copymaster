FROM alpine:latest

# add dependencies
RUN apk add --no-cache bash rclone

# add script
RUN mkdir -p /scripts
COPY copy.sh watch.sh /scripts/
RUN chmod +x /scripts/copy.sh /scripts/watch.sh

# add cron job
COPY crontab.txt /crontab.txt
RUN crontab /crontab.txt

# allow user to add their rclone config file
VOLUME /root/.config/rclone

CMD ["/scripts/watch.sh"]