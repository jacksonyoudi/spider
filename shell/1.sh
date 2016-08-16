#!/bin/bash

function printline()
{
echo  "--------------------------------------------------------------------"

}






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
git clone https://github.com/jacksonyoudi/nali.git


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

redcolor 一、检查系统错误登录日志,统计IP重试次数，并输出地理位置信息

for i in `lastb |awk '{print $3}'|grep '[0-9]'`
do
	nali $i >> 1
done
cat 1 |sort -k1|uniq -c|sort -k1 -n -r|awk 'BEGIN{
print "----------------------------------------------------------------------";
print "| 尝试登录次数  |         IP和地理位置信息                            |";
print "----------------------------------------------------------------------"
} 
{
printf "|%-7s%-8s|%-3s%s%s|\n"," ",$1," ",$2,$3;
}
END{
print "-----------------------------------------------------------------------"

}
'
rm -rf 1

}

function user_check()
{
#检查系统用户
#检查内容：查看是否有异常的系统用户
#1、检查是否有异常用户，可登录的用户

redcolor 二、检查用户
redcolor "2.1 显示出shell是非/sbin/nologin:"
cat  /etc/passwd | cat /etc/passwd |awk -F: '$7!="/sbin/nologin"{print $0}'  |awk -F: ' BEGIN{ 
print "------------------------------------------------------------------------";
print "|    用户名     |      shell                                           |";
print "-----------------------------------------------------------------------";
}
{
printf "|%-3s%-12s|%-3s%s\n"," ",$1," ",$7;
}
END{
print "-----------------------------------------------------------------------";
}
' 


#查看特权用户
redcolor "2.2 查看特权用户与特权用户组"
cat /etc/passwd |awk -F: 'BEGIN{
print "-----------------------------------------------------------------------";
print "|        用户名               |       UID      |            GID       |";
print "-----------------------------------------------------------------------";
}

{if ( ($3==0) ||  ($4 == 0)){ 

 printf "|%-5s%-24s|%-7s%-9s|%-7s%-15s|\n"," ",$1," ",$3," ",$4;

}}

END{
print "-----------------------------------------------------------------------";
}
'


#查看passwd的修改时间，判断是否在不知的情况下添加用户
redcolor "2.3 /etc/passwd最近一次修改时间为"
ls -l /etc/passwd|awk 'BEGIN{
print "-----------------------------------------------------------------------";
print "|              最后一次修改时间                                       |";
print "-----------------------------------------------------------------------";
}
{printf "|%-15s%-2s%s%-2s%s%s\n"," ",$6," ",$7," ",$8;}
END{
print "----------------------------------------------------------------------";
}'

#查看是否有空密码的账户
redcolor "2.4  空密码登录的用户"
p=`cat /etc/shadow |awk -F: '
length($2)==0 {print $1} 
'`



if [ $p=='' ]
then
echo "---------------------------------------------------------------------"
echo "|                         无                                        | "
echo "---------------------------------------------------------------------"
else
	printline 
    echo  $p
 	printline
fi

redcolor "2.5 可密码登录的用户有："
printline
cat /etc/shadow |awk -F: '{ if(($2!="!!") &&  ($2!="*" )) {print $1;} }'
printline
}


process_check()
{
redcolor "三、检查异常进程"
redcolor "3.1 显示uid为零的用户进程"
printline
ps auxn |awk '{print $1,$11}'|awk '{if($1 == 0) {print $2}}'
printline

#检查隐藏进程
#比较文件
redcolor  "3.2 显示异常进程PID"
ps -ef |awk '{print $2}' |sort -n |uniq >1
ls /proc |sort -n |grep '[0-9]'  >2

printline
diff 1 2|grep '<'
diff  1 2 |grep '>'
printline
rm -rf 1 2 
}

function  systemfile_check()
{

redcolor  "四、系统文件检查"
redcolor "4.1 显示包含SUID权限的文件(格式：文件名 用户 权限)"
printline
find / -perm +4000 -printf '%p %u %#m\n'  2> /dev/null
printline

redcolor "4.2 显示文件大小大于10M的文件"
printline
find / -size +10000k -print  2> /dev/null
printline

redcolor "4.3 显示特殊文件"
redcolor "4.3.1 显示以...命名的文件"
one=`find / -name "..." -print 2>/dev/null`
if [ $one =="" ]
then
printline
echo "|                                无                                |"
printline 
else
	printline
    echo $one
	printline
fi

redcolor  "4.3.2 显示以..命名的文件"
two=`find / -name ".." -print 2>/dev/null`
if [ $two =="" ]
then
printline
echo "|                                无                                |"
printline 
else
        printline
    echo $two
        printline
fi


redcolor   "4.3.3 显示以..命名的文件"
three=`find / -name "." -print 2>/dev/null`
if [ $three =="" ]
then
printline
echo "|                                无                                |"
printline 
else
        printline
    echo $three
        printline
fi



redcolor "4.3.4 显示以  （空格）命名的文件"
four=`find / -name  "  " -print 2>/dev/null`
if [ $four =="" ]
then
printline
echo "|                                无                                |"
printline 
else
        printline
    echo $four
        printline
fi

}

function   fileintegrity_check()
{
redcolor  "十、检查文件完整性"
#read -p '请输入你要检查的文件,注意完整路径:'  a

redcolor "输出结果："
printline
rpm  -qf  /bin/ls
rpm  -qf  /bin/login
md5sum -b   /bin/login
md5sum -t  /bin/login
printline
}


function rpmintergrity_check()
{

#检查文件的完整性
redcolor "五、检查文件完整性"
rpm  -Va

}

function network_check()
{

#检查网络
redcolor "六、检查网络"
redcolor "6.1 检查sniffer"
a = `ip link | grep PROMISC`
if  [ $a=='' ]
then
    printline
    echo  "网络可以排除sniffer嗅探器"
    printline
esle
    printline
    echo "系统可能受到sniffer的嗅探器"
    printline
    echo $a
    printline
fi

#显示建立连接的情况
redcolor "6.2 显示建立连接的情况"
lsof -i |grep 'ESTABLISHED'|awk '
BEGIN{
print "-----------------------------------------------------------------------------------------------------------------------";
print "|   命令     |   用户    |                名称                              |                    状态                  |";
print "------------------------------------------------------------------------------------------------------------------------"
}
{printf "|%-2s%-10s|%-3s%-8s|%-3s%-50s|%-3s%-37s|\n" ," ",$1," ",$3," ",$9," ",$10}
END{
print "------------------------------------------------------------------------------------------------------------------------";
}'

#显示处于监听状态的程序
redcolor "6.3 显示处于监听状态的程序"
lsof -i |grep 'LISTEN'|awk '
BEGIN{
print "-----------------------------------------------------------------------------------------------------------------------";
print "|   命令     |   用户    |                名称                              |                    状态                  |";
print "------------------------------------------------------------------------------------------------------------------------"
}
{printf "|%-2s%-10s|%-3s%-8s|%-3s%-50s|%-3s%-37s|\n" ," ",$1," ",$3," ",$9," ",$10}
END{
print "------------------------------------------------------------------------------------------------------------------------";
}'



#查看不正常打开的TCP/UDP端口
#redcolor "6.4 显示网络"
#netstat -nap


redcolor "6.5 显示ARP"
printline
arp  -a
printline

}

function crontab_check()
{
#检查系统计划任务
redcolor "七、检查系统计划任务"
redcolor "7.1 列出root的计划任务"

crontab -u root -l | grep -v '^#' |awk 'BEGIN {
print "----------------------------------------------------------------------------------------------------";
print "|                     时间          |                         命令                                 |";
print "----------------------------------------------------------------------------------------------------";  
}
{printf "|%-3s%-57s|\n"," ",$0;                                                                                                     
}
END{
print "---------------------------------------------------------------------------------------------------";

}
'

redcolor "7.2 显示系统的计划任务"
printline
cat /etc/crontab |grep -v '^#'
printline


redcolor  "7.3 显示所有的计划任务"
echo "----------------------------------------------------------------------------------------------------------------------------"
ls /etc/cron.*
echo "----------------------------------------------------------------------------------------------------------------------------"

}


function backdoor_check()
{
#检查系统后门
redcolor "八、检查系统后门"
redcolor "8.1 查看计划任务"
redcolor "/etc/crontab"
printline
cat /etc/crontab|grep -v '^#'|grep '^$'
printline 

redcolor "/var/spool/cron"
printline
ls /var/spool/cron
printline 

redcolor "8.2 自启文件以及运行级别文件"
redcolor "/etc/rc.d/rc.local"
echo "--------------------------------------------------------------------------------"
cat /etc/rc.d/rc.local |grep -v '^#'|grep -v '^$'
echo "--------------------------------------------------------------------------------"

redcolor "/etc/rc.d"
echo "----------------------------------------------------------------------------------------------------------------------"
ls /etc/rc.d
echo "----------------------------------------------------------------------------------------------------------------------"

redcolor "/etc/rc3.d"
echo "-----------------------------------------------------------------------------------------------------------------------------------"
ls /etc/rc3.d
echo "-----------------------------------------------------------------------------------------------------------------------------------"

}


function server_check()
{
#检查系统服务
redcolor "九、检查系统"
redcolor "9.1 查看开机启动的服务"
printline
chkconfig --list |grep ":on"
printline

#查看rpc服务
redcolor "9.2 查看rpc服务"
a= `rpcinfo -p 2>/dev/null`
if [ $? == 0 ]
then
	printline
    	echo $a
	printline
else
	printline
    	echo "对不起，系统没有安装rpc"
	printline
fi

}

function rootkit_check()
{
redcolor "十一、检查rootkit"
a=`rkhunter -c 2>/dev/null`
if [ $? == 0 ]
then
echo $a
else 
printline
echo "对不起，系统没有安装rootkit"
printline
fi 


b=`chkrootkit -q 2>/dev/null`
if [ $? == 0 ]
then
echo $b
else
printline
echo "对不起，系统没有安装rootkit"
printline
fi

}


function main()
{

nali_install
lstabip
sleep 2
user_check
sleep 2
process_check
sleep 2
systemfile_check
sleep 2
#rpmintergrity_check
network_check
sleep 2
crontab_check
sleep 2
backdoor_check
sleep 2
server_check
sleep 2
rootkit_check
sleep 2
fileintegrity_check

}


main
