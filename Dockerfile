FROM centos:centos7
MAINTAINER zhcshine zhcshine@126.com

# 安装python3.6.6
RUN yum groupinstall -y "Development tools" && \
    yum install -y wget zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel && \
    yum clean all && \
    wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tar.xz && \
    tar -xJf Python-3.6.6.tar.xz && cd Python-3.6.6 && \
    ./configure --prefix=/usr/local/python3 && make && make install && \
    ln -s /usr/local/python3/bin/python3 /usr/bin/python3 && \
    ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3 && \
    rm -rf Python-3.6.6.tar.xz Python-3.6.6

VOLUME /data

CMD ["python3"]

