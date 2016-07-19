FROM aegir/hostmaster

# You may override
ENV AEGIR_CLIENT_NAME admin
ENV AEGIR_CLIENT_EMAIL aegir@aegir.docker

# Change this for released versions
ENV AEGIR_MAKEFILE https://raw.githubusercontent.com/opendevshop/devshop/1.x/build-devmaster.make
ENV AEGIR_PROFILE devmaster
ENV AEGIR_VERSION 1.x

USER root
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER aegir
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["drush @hostmaster hosting-queued"]