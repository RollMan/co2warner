FROM dea82/avr-gcc-docker

RUN apk add --no-cache make ncurses-dev freeglut-dev libelf-dev

RUN cd / && \
    git clone https://github.com/buserror/simavr.git && \
    cd simavr && \
    make && \
    make install && \
    rm -rf /simavr

WORKDIR /work
