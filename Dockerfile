FROM debian:12

LABEL maintainer="Imanuel Chandra Lefta <lefta.chandra@gmail.com>"

ENV container docker
ENV DEBIAN_FRONTEND noninteractive
STOPSIGNAL SIGRTMIN+3
VOLUME [ "/tmp", "/run", "/run/lock" ]
WORKDIR /
# Enable systemd.
RUN apt-get update ; \
    apt-get install -y systemd systemd-sysv; \
    apt-get clean ;

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
  /etc/systemd/system/*.wants/* \
  /lib/systemd/system/local-fs.target.wants/* \
  /lib/systemd/system/sockets.target.wants/*udev* \
  /lib/systemd/system/sockets.target.wants/*initctl* \
  /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
  /lib/systemd/system/systemd-update-utmp*

CMD [ "/lib/systemd/systemd", "log-level=info", "unit=sysinit.target" ]