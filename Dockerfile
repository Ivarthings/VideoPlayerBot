FROM python:3.9.2-slim

RUN apt update && apt upgrade -y
RUN apt install git python3-pip ffmpeg -y

RUN mkdir /safone/
WORKDIR /safone/
COPY . /safone/

RUN pip3 install -U -r requirements.txt

CMD python3 main.py
