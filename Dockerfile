# https://gist.github.com/kenminglee/ce1d3b0273b3976f8485fd9a61033bc3
# docker run -it -p 8888:8888 -v ~/notebooks:/home/notebook jupyter-notebook-img:local

FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        python3.8 \
        python3-pip \
        python3.8-dev \
        libgdal-dev \
        build-essential \
        libspatialindex-dev

RUN pip3 install --upgrade pip
RUN python3 -m pip uninstall --y pip \
    && apt install -y python3-pip --reinstall

COPY ./requirements.txt requirements.txt
RUN pip3 install -r requirements.txt 

EXPOSE 8888

WORKDIR /home/notebook/
ENTRYPOINT ["jupyter"]

CMD ["notebook", "--allow-root", "--ip=0.0.0.0", "--no-browser"]