ARG ARCH

FROM ${ARCH}technicalguru/mailserver-postfixadmin:latest

ADD config_setup_pfa    /var/www/html/

CMD ["sh", "-c","/var/www/html/config_setup_pfa; apache2-foreground"]





