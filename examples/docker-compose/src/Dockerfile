# faster build: patching the latest tags of images locally
ARG ARCH

FROM ${ARCH}technicalguru/mailserver-postfixadmin:latest AS postfixadmin

ADD config_setup_pfa    /var/www/html/

CMD ["sh", "-c","/var/www/html/config_setup_pfa; apache2-foreground"]


FROM ${ARCH}technicalguru/mailserver-roundcube:latest AS roundcube

COPY config_setup_rc    /var/www/html/config_setup_rc

CMD ["sh", "-c","/var/www/html/config_setup_rc; apache2-foreground"]


FROM ${ARCH}technicalguru/mailserver-postfix:latest AS postfix

RUN apt update && apt install -y curl && mv -f /etc/postfix /etc/postfix_orig \
    && ln -s /etc/postfix_orig /etc/postfix \
    && curl "https://raw.githubusercontent.com/nelu/docker-mailserver-postfix/refs/heads/master/src/entrypoint.sh" -o /usr/local/mailserver/entrypoint.sh

VOLUME ["/etc/postfix", "/var/spool/postfix", "/var/vmail"]


FROM ${ARCH}technicalguru/mailserver-amavis:latest AS amavis

RUN apt install -y curl && mv -f /var/lib/clamav /var/lib/clamav_orig \
    && ln -s /var/lib/clamav_orig /var/lib/clamav \
    && curl "https://raw.githubusercontent.com/nelu/docker-mailserver-amavis/refs/heads/master/src/entrypoint.sh" -o "/usr/local/amavis/entrypoint.sh"

VOLUME ["/var/lib/clamav", "/var/virusmails"]



