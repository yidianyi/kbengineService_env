
FROM yidianyi/ubuntu16.04

USER root

RUN groupadd -r kbe -g 32765 
RUN useradd -u 32766 -r -g kbe -d /home -s /sbin/nologin -c "Docker image user" kbe 
RUN chown -R kbe:kbe /home

RUN apt update -y
RUN apt install -y libssl-dev
RUN apt install -y libmysqld-dev
RUN apt install -y python

USER kbe

