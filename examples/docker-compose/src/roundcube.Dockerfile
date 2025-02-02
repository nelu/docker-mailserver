ARG ARCH

FROM ${ARCH}technicalguru/mailserver-roundcube:latest

COPY config_setup_rc    /var/www/html/config_setup_rc

CMD ["sh", "-c","/var/www/html/config_setup_rc; apache2-foreground"]





