FROM chazzofalf/ubuntu-base-docker-recipe
ENV __OLD_DEBIAN_FRONTEND="$DEBIAN_FRONTEND"
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -yq screen whois
ENV DEBIAN_FRONTEND="$__OLD_DEBIAN_FRONTEND"
COPY docker-entrypoint.sh /etc/docker-entrypoint.sh
COPY docker-user-setup.sh /etc/docker-user-setup.sh
COPY docker-prelogin.sh /etc/docker-prelogin.sh
COPY docker-prelogin-foreground.sh /etc/docker-prelogin-foreground.sh
COPY docker-login.sh /etc/docker-login.sh
RUN mkdir /etc/docker-prelogin.d
RUN mkdir /etc/docker-prelogin-foreground.d
RUN mkdir /etc/docker-user-setup.d
RUN mkdir /etc/docker-user-setup-scripts.d
RUN chmod +x /etc/docker-entrypoint.sh
RUN chmod +x /etc/docker-user-setup.sh
RUN chmod +x /etc/docker-prelogin.sh
RUN chmod +x /etc/docker-prelogin-foreground.sh
RUN chmod +x /etc/docker-login.sh
ENTRYPOINT [ "/etc/docker-entrypoint.sh" ]
