FROM alpine

LABEL maintainer="Jens Heidbüchel <j.heidbuechel@mailbox.org>"
ENV REFRESHED_AT 2022-10-24

RUN apk add --no-cache cups cups-filters

ADD cupsd.conf /etc/cups/cupsd.conf
ADD cups-files.conf /etc/cups/cups-files.conf
ADD printers.conf /etc/cups/printers.conf
ADD ppd/Brother_HL-2170W_series.ppd /etc/cups/ppd/Brother_HL-2170W_series.ppd

EXPOSE 631

CMD ["/usr/sbin/cupsd", "-f"]
