FROM centos:7.7.1908
ENV LANG=en_US.utf8

RUN yum -y update
RUN yum install -y epel-release gcc zlib-devel wget openssl-devel make which  # 我就是故意想在 CentOS 上裝 Python3 啦
RUN mkdir /src_package && cd /src_package && wget https://www.python.org/ftp/python/3.6.10/Python-3.6.10.tgz

# ffmpeg
RUN wget https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
RUN yum install -y rpmfusion-free-release-7.noarch.rpm
RUN yum install -y ffmpeg ffmpeg-devel

# make install Python3.6 
RUN cd /src_package && tar xvzf Python-3.6.10.tgz
RUN cd /src_package/Python-3.6.10 && \
./configure --with-ssl && make altinstall
RUN ln -s /usr/local/bin/python3.6 /usr/bin/python3
RUN ln -s /usr/local/bin/pip3.6 /usr/bin/pip3

RUN source ~/.bashrc
RUN mkdir /proj/youtubedl && cd /proj/youtubedl
RUN pip3 install pipenv
RUN pipenv install
WORKDIR /proj/youtubedl