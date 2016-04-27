
FROM yidianyi/ubuntu16.04

USER root

RUN groupadd -r kbe -g 32765 
RUN useradd -u 32766 -r -g kbe -d /home -s /sbin/nologin -c "Docker image user" kbe 
RUN chown -R kbe:kbe /home

RUN apt update -y
RUN apt install -y libssl-dev
RUN apt install -y libmysqld-dev

ENV UID 32766
ENV KBE_ROOT /home/kbengine
ENV KBE_RES_PATH $KBE_ROOT/kbe/res/:$KBE_ROOT/assets/:$KBE_ROOT/assets/scripts/:$KBE_ROOT/assets/res/
ENV KBE_BIN_PATH $KBE_ROOT/kbe/bin/server/

VOLUME  /home/kbengine

USER kbe

