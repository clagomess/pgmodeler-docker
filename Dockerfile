FROM ubuntu:xenial

## libs
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y wget vim qtchooser pkg-config
RUN apt-get install -y qt5-default
RUN apt-get install -y libpq-dev libxml2* libqt5svg5*
RUN apt-get install -y qttools5*

## build
RUN wget https://github.com/pgmodeler/pgmodeler/archive/v0.9.2.tar.gz
RUN tar -xvf v0.9.2.tar.gz
RUN mv pgmodeler-0.9.2 pgmodeler && cd pgmodeler && ./linuxdeploy.sh

## add libs that only on xenial
RUN cp /lib/x86_64-linux-gnu/libpng12.so.0 /pgmodeler/build/opt/pgmodeler/lib
RUN cd /pgmodeler/build/opt/ && tar -czvf /pgmodeler/dist/pgmodeler.tar.gz pgmodeler