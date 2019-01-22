FROM bobrik/curator:5.6.0

COPY config_file.yml /usr/share/curator/config/config_file.yml

COPY action_file.yml /usr/share/curator/config/action_file.yml

USER root

COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["start.sh"]

