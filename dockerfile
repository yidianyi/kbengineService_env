FROM yidianyi/ubuntu16.04

USE root

RUN groupadd -r kbe -g 32765 && \
useradd -u 32766 -r -g kbe -d <homedir> -s /sbin/nologin -c "Docker image user" kbe && \
chown -R kbe:kbe <homedir>

RUN apt update -y
RUN apt install -y libssl-dev
RUN apt install -y libmysqld-dev

RUN soft nofile 65535
RUN	hard nofile 65535

RUN echo 524288 > /proc/sys/net/core/rmem_max
RUN echo 524288 > /proc/sys/net/core/wmem_max

ENV UID 32766
ENV KBE_ROOT ~/kbengine/
ENV KBE_RES_PATH $KBE_ROOT/kbe/res/:$KBE_ROOT/assets/:$KBE_ROOT/assets/scripts/:$KBE_ROOT/assets/res/
ENV KBE_BIN_PATH $KBE_ROOT/kbe/bin/server/

VOLUME  ~/kbengine/

USE kbe

