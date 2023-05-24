FROM tomcat:9.0.75-jre17

RUN apt update && apt install unzip -y && \
    wget --no-verbose -O /tmp/orbeon.zip "https://github.com/orbeon/orbeon-forms/releases/download/tag-release-2022.1-ce/orbeon-2022.1.202212310353-CE.zip" && \
    cd /tmp && unzip orbeon.zip && \
    mkdir deploy && cd deploy && \
    unzip $(find .. -name orbeon.war) && \
    mv /tmp/deploy /usr/local/tomcat/webapps/orbeon && \
    rm -rf /tmp/orbeon.zip /tmp/deploy /var/cache/apt

EXPOSE 8080
CMD ["catalina.sh", "run"]
