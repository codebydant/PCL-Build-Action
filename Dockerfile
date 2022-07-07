FROM danieltobon43/pcl-docker:1.12.1-alpine3.15-All-dev AS build
USER root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
