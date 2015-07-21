# Galaxy - colibread
#
# VERSION       0.2

FROM bgruening/galaxy-stable

MAINTAINER Cyril Monjeaud, Cyril.Monjeaud@irisa.fr

ENV GALAXY_CONFIG_BRAND colibread

WORKDIR /galaxy-central

ADD install_R_gplots.sh /tmp/install_R_gplots.sh
RUN sh /tmp/install_R_gplots.sh

# Install colibread
RUN install-repository \
    "--url https://toolshed.g2.bx.psu.edu/ -o cmonjeau --name discosnp_plus_plus --panel-section-name Colibread:discosnp++" \
    "--url https://toolshed.g2.bx.psu.edu/ -o cmonjeau --name mapsembler2 --panel-section-name Colibread:mapsembler2" \
    "--url https://toolshed.g2.bx.psu.edu/ -o cmonjeau --name commet --panel-section-name Colibread:commet" \
    "--url https://toolshed.g2.bx.psu.edu/ -o cmonjeau --name kissplice --panel-section-name Colibread:kissplice" \
    "--url https://toolshed.g2.bx.psu.edu/ -o cmonjeau --name lordec --panel-section-name Colibread:lordec" \
    "--url https://toolshed.g2.bx.psu.edu/ -o cmonjeau --name takeabreak --panel-section-name Colibread:takeabreak" \
    "--url https://toolshed.g2.bx.psu.edu/ -o cmonjeau --name archive_toolbox --panel-section-name Archive"


# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]

