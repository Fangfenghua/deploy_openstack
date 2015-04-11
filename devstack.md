1 替换为阿里源   
centos and epel   
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo  
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo  
yum makecache

pip

[global]
index-url=http://mirrors.aliyun.com/pypi/simple/
timeout=6000




