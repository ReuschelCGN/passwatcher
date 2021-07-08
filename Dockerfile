# Basic Docker image for passwatcher

FROM alpine:latest
COPY ./scripts/hourly/* /etc/periodic/hourly

RUN apk update && \
    apk upgrade && \
    apk add --no-cache python3 py3-pip && \
    chmod a+x /etc/periodic/hourly/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./requirements.txt .
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1

COPY . /usr/src/app
RUN rm -rf scripts \
