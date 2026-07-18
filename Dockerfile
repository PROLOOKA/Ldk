FROM jrottenberg/ffmpeg:6.1-alpine

WORKDIR /app

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 8080

CMD ["/app/start.sh"]
