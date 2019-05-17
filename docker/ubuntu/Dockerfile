FROM ubuntu:16.04

MAINTAINER fuselabs

RUN apt-get update -y && \
    apt-get install -y software-properties-common
RUN apt-add-repository ppa:deadsnakes/ppa -y
RUN apt-get update
RUN apt-get install -y python3.6-dev
RUN apt-get install -y curl
RUN apt-get install -y gcc
RUN apt-get install -y locales-all
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6

# Copy sample applicationrh-py
COPY . /13.core-bot

# Install Requirements
RUN pip install --upgrade pip 

RUN pip install -r /13.core-bot/requirements.txt

ENV FLASK_APP=/13.core-bot/main.py
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

EXPOSE 3978

WORKDIR /13.core-bot

#ENTRYPOINT ["python3.6", "-c", "import time ; time.sleep(500000)"]
ENTRYPOINT [ "flask" ]
CMD [ "run", "--port", "3978", "--host", "0.0.0.0" ]
