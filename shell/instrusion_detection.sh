#!/bin/bash
function redcolor()
{
#字体红色显示
    printf "\033[1;31;40m \n $@\033[0m\n"
}


function nali_install()
{
echo "安装git "
sleep 2

yum install git    -y
cd   /usr/src

echo "下载nali软件包，通过git克隆"
git clone https://github.com/devops/spider_baike.git clone


if [ $? == 0 ]
then
	tar zxf nali-0.2.tar.gz && cd nali-0.2
	./configure
	make && make install
	nali 8.8.8.8  &> /dev/null
	  if  [ $? == 0 ]
	   then
	       echo "更新数据库"
		   nali-update
	  fi



fi
}



function lstabip()
{


#function: 检查系统错误登录日志,统计IP重试次数，并输出地理位置信息

redcolor 检查系统错误登录日志,统计IP重试次数，并输出地理位置信息

cat 1 |sort -k1|uniq -c|sort -k1 -n -r|tr -s ' '|awk 'BEGIN{print "尝试登录次数","     ","IP和地理位置信息"} {print "   ",$1,"         ",$2}'
do
	nali $i >> 1
done
cat 1 |sort -k1|uniq -c|sort -k1 -n -r
rm -rf 1

}

function user_check()
{
#检查系统用户
#检查内容：查看是否有异常的系统用户
#1、检查是否有异常用户，可登录的用户
redcolor "显示出shell是非/sbin/nologin:"
cat  /etc/passwd | cat /etc/passwd |awk -F: '$7!="/sbin/nologin"{print $0}'  ||awk -F: '{print $1,$7}'

#查看特权用户
redcolor "查看特权用户与特权用户组"
cat /etc/passwd |awk -F: '{if ( ($3==0) ||  ($4 == 0)){ print $0;}}'


#查看passwd的修改时间，判断是否在不知的情况下添加用户
redcolor "/etc/passwd最近一次修改时间为"
ls -l /etc/passwd|awk '{print $6,$7,$8}'


#查看是否有空密码的账户
redcolor "空密码登录的用户"
p=`cat /etc/shadow |awk -F: 'length($2)==0 {print $1}'`
if [ $p =='' ]
then
    redcolor "无"

else
    redcolor $p
fi

redcolor "可密码登录的用户有："
cat /etc/shadow |awk -F: '{ if(($2!="!!") &&  ($2!="*" )) {print $1;} }'

}


process_check()
{
#检查异常进程
redcolor "显示uid为零的用户进程"
ps auxn |awk '{print $1,$11}'|awk '{if($1 == 0) {print $2}}'

#检查隐藏进程
#比较文件

ps -ef |awk '{print $2}' |sort -n |uniq >1
ls /proc |sort -n |grep '[0-9]'  >2

redcolor ""
diff 1 2|grep '<'
redcolor "隐藏进程"
diff  1 2 |grep '>'

}

function  systemfile_check()
{


redcolor "显示包含SUID权限的文件(格式：文件名 用户 权限)"
find / -perm +4000 -printf '%p %u %#m\n'  2> /dev/null

redcolor "显示文件大小大于10M的文件"
find / -size +10000k -print  2> /dev/null


redcolor "显示特殊文件"
redcolor "显示以...命名的文件"
one=`find / -name "..." -print 2>/dev/null`
if [ $one =="" ]
then
    redcolor "无"
else
    redcolor $one
fi

redcolor "显示以..命名的文件"
two=`find / -name ".." -print 2>/dev/null`
if [ $two =="" ]
then
    redcolor "无"
else
    redcolor $two
fi


redcolor "显示以..命名的文件"
three=`find / -name "." -print 2>/dev/null`
if [ $three =="" ]
then
    redcolor "无"
else
    echo $three
fi

redcolor "显示以  （空格）开头命名的文件"
four=`find / -name  "  " -print 2>/dev/null`
if [ $two =="" ]
then
    echo "无"
else
    echo $four
fi

}

function   fileintegrity_check()
{
#检查文件完整性
 rpm -qf
 read -p '请输入你要检查的文件,注意完整路径'  a

rpm  -qf  $a
md5sum -b   $a
md5sum -t $a

}


function rpmintergrity_check()
{

#检查文件的完整性
redcolor "检查文件完整性"
rpm  -Va

}

function natwork_check()
{

#检查网络

a = `ip link | grep PROMISC`
if  [ a=='' ]
then
    redcolor "网络可以排除sniffer嗅探器"
esle
    redcolor "系统可能受到sniffer的嗅探器"
    echo $a
fi

#显示建立连接的情况
redcolor "显示建立连接的情况"
lsof -i |grep 'ESTABLISHED'|awk '{print $1,$3,$9,$10}'

#显示处于监听状态的程序
redcolor "显示处于监听状态的程序"
lsof -i |grep 'LISTEN'|awk '{print $1,$3,$9,$10}'


#查看不正常打开的TCP/UDP端口
redcolor "显示网络"
netstat -nap


redcolor "显示ARP"
arp  -a

}

function crontab_check()
{
#检查系统计划任务

redcolor "列出root的计划任务"
crontab -u root -l

redcolor "显示系统的计划任务"
cat /etc/crontab

redcolor  "显示所有的计划任务"
ls /etc/cron.*

}


function backdoor_check()
{
#检查系统后门
redcolor "检查内容如下："
cat /etc/crontab
ls /var/spool/cron
cat /etc/rc.d/cron

}


function server_check()
{
#检查系统服务
redcolor "查看开机启动的服务"
chkconfig  list |grep ":on"

#查看rpc服务
a= `rpcinfo -p 2>/dev/null`
if [ $?== 0 ]
then
    echo $a

else
    echo "对不起，系统没有安装rpc"

fi

}



function main()
{

nali_install
lstabip
user_check
systemfile_check
#rpmintergrity_check
natwork_check
crontab_check
backdoor_check
server_check

}


main