FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive


# 安装相关依赖包, ruby2.2
RUN apt-get update \ 
	&& apt-get install -y software-properties-common \ 
	&& apt-add-repository ppa:brightbox/ruby-ng \ 
	&& apt-get update \ 
	# 安装ruby相关
	&& apt-get install -y ruby2.2 ruby2.2-dev \ 
	&& apt-get install -y vim curl make \ 
	&& curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - \ 
	&& apt-get install -y nodejs \ 
	&& npm install -g cnpm --registry=https://registry.npm.taobao.org \ 
	&& cnpm install -g gulp \ 	
	&& gem sources --add https://gems.ruby-china.org/ --remove https://gems.ruby-china.com/ \
	&& gem install sass \
	&& gem install compass \ 
	&& gem install compass-normalize \ 	
	&& apt-get remove -y curl make vim \ 
	&& rm -rf /var/lib/apt/lists/* 


# 其他相关配置
# 添加挂载卷
VOLUME /data
# 暴露端口
EXPOSE 3000 3001


# 添加启动脚本
ADD run.sh /root/run.sh
RUN chmod u+x /root/run.sh
CMD /root/run.sh 
