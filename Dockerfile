FROM ubuntu:latest
MAINTAINER Tien Anh "anhb2105661@student.ctu.edu.vn"

RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv curl

ADD . /flask_app
WORKDIR /flask_app

RUN python3 -m venv venv
RUN venv/bin/python -m pip install --upgrade pip && \
    venv/bin/python -m pip install --no-cache-dir -r requirements.txt

ENV PATH="/flask_app/venv/bin:$PATH"

ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]
