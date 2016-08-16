#!/usr/bin/env python
#coding: utf-8


import  os

shell = '''#function: 检查系统错误登录日志,统计IP重试次数，并输出地理位置信息

echo "检查系统错误登录日志,统计IP重试次数，并输出地理位置信息"

for i in `lastb |awk '{print $3}'|grep '[0-9]'`
do
	nali $i >> 1
done
cat 1 |sort -k1|uniq -c|sort -k1 -n -r
rm -rf 1'''

output = os.popen(shell)
print type(output)
a=output.read()
print type(a)
print a
b=a.split(' ')