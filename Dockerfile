FROM centos

RUN yum -y install httpd

CMD echo "Hello World...!!!"