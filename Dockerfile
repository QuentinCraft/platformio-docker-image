FROM ubuntu:latest

WORKDIR /app

RUN apt-get update -y
RUN apt-get install curl python3 python3-venv -y
RUN curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py -o get-platformio.py
RUN python3 get-platformio.py
RUN cp -r /root/.platformio/penv/bin/* .

RUN mkdir src
RUN mkdir dest

CMD ["./pio", "run", "-d", "src"]