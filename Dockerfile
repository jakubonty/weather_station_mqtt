ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY data/run.sh /
COPY maserver/* /

RUN apk add --no-cache npm
RUN npm install
RUN chmod a+x /run.sh

# Expose tcp/8080
EXPOSE 8080/tcp
EXPOSE 8080/udp
EXPOSE 8003/udp

CMD [ "/run.sh" ]