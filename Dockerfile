FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1
ENV INSTANCE 1

RUN mkdir /app

WORKDIR /app

ADD Pipfile /app/


RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install pipenv && pipenv install --dev

RUN apk del .build-deps

ADD . /app/

EXPOSE 8000
