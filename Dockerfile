FROM python:3.10-alpine

ENV PYTHONUNBUFFERED=1
ENV PATH="/home/user/.local/bin:${PATH}"

RUN apk add build-base linux-headers

WORKDIR /app

RUN adduser -D user && chown -R user:user /app
USER user

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY ./app /app
