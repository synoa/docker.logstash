# This is the official Logstash Image Repository
FROM docker.elastic.co/logstash/logstash:5.2.2
MAINTAINER Kevin Gimbel <docker@kevingimbel.com>

# Install beats and elasticsearch plugins
RUN logstash-plugin install logstash-input-beats
RUN logstash-plugin install logstash-output-elasticsearch

# Copy the default logstash file. This is only used during build.
# Later you should mount your config directory to /logstash-config/
COPY logstash.conf /logstash-config/

EXPOSE 5044

CMD ["logstash", "-f", "/logstash-config/logstash.conf"]
