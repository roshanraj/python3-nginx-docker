FROM ubuntu:18.04

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && python -m pip install --upgrade pip==18.1

RUN apt-get clean && apt-get update && apt-get install -y locales
RUN apt-get install supervisor nginx-full libnginx-mod-http-cache-purge libnginx-mod* -y
#CMD ["python"]
