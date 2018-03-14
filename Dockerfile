FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

# 安装相关软件包
RUN apt-get update && apt-get install -y vim \ 
	apache2 \ 
	php5 \ 
	curl \
	php5-mysql \ 
	php5-gd \ 
	php5-curl \ 
	php5-imagick 


# 配置apache
# 开启rewrite重写
RUN a2enmod rewrite
# 修改apache默认目录
RUN sed -ri -e 's!/var/www/html!/data!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!/data!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
# 配合rewrite重写,读取.htaccess等文件
RUN sed -ri -e 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf


# 其他相关配置
# 添加挂载卷
VOLUME /data
# 暴露80端口
EXPOSE 80


# 添加启动脚本
ADD run.sh /root/run.sh
RUN chmod u+x /root/run.sh
CMD /root/run.sh 
