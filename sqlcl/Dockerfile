FROM oraclelinux:latest

ADD sqlcl-* .
RUN yum -y install wget unzip java-1.8.0-openjdk-devel \
     && unzip sqlcl*.zip \
     && yum clean all
ENV PATH=/sqlcl/bin:$PATH
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O /usr/bin/jq && chmod +x /usr/bin/jq

ENTRYPOINT ["/bin/bash", "/sqlcl/bin/sql" ]
