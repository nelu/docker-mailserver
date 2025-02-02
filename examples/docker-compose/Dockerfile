# continous build for latest tag
ARG ARCH

FROM ${ARCH}technicalguru/mailserver-postfix:latest

RUN cp -rfp /etc/postfix /etc/postfix_orig

VOLUME ["/etc/postfix", "/var/spool/postfix", "/var/vmail"]

CMD ["sh", "-c","[ -z \"$(ls -A /etc/postfix)\" ] && cp -arfp /etc/postfix_orig/. /etc/postfix/ ; /usr/local/mailserver/entrypoint.sh"]





