#!/usr/bin/env python
#coding: utf-8


import sys
reload(sys)
sys.setdefaultencoding("utf-8")


import urllib
import urllib2
import re
import json
from bs4 import BeautifulSoup
import os
import xlsxwriter

url='http://www.idreamsky.com'
try:
    request = urllib2.Request(url)
    response = urllib2.urlopen(request)
    htmldoc = response.read()
    #htmldoc = content.decode("utf8")

    soup=BeautifulSoup(htmldoc,'html.parser',from_encoding="utf8")
    a=soup.find_all('p',title=re.compile(ur"[\u4e00-\u9fa5]+"))
    b=soup.find_all('p',class_="blue")



    s=sys.stdout
    f=open('out.txt','w')
    sys.stdout=f
    for i in a:
        print i
    for i in b:
        print i
    sys.stdout=s
    f.close()

    f=open('out.txt','r')
    print f
    print type(f)
    d=[]
    for i in f:
        print i
        j=i.split("<")[1].split(">")[1]
        print j
        d.append(j)

    print d
    g=[]
    for i in range(0,12):
        g.append(d[i])
        print d[i]

    print g
    v=[]
    for i in range(26,38):
        v.append(int(d[i].split("万")[0]))
        print d[i]

    print v

    for i in range(0,12):
        print g[i],v[i]
    workbook = xlsxwriter.Workbook('demo.xlsx')
    worksheet = workbook.add_worksheet()

    worksheet.set_column('A:A',20)
    bold = workbook.add_format({'bold': True})

    top=workbook.add_format({'border':6,'align':'center','bg_color':'cccccc','font_size':13,'bold':True})
    title=['游戏项目','下载情况/万']
    worksheet.write_row('A1',title,top)


    for i in range(2,14):
        p='A'+str(i)
        q='B'+str(i)


        j=i-2

        worksheet.write(p,g[j])
        worksheet.write(q,v[j])

    chart = workbook.add_chart({'type': 'column'})
    worksheet.insert_chart('A17',chart)

    chart.add_series({
        'categories': '=Sheet1!$A$2:$A$13',
        'values':      '=Sheet1!$B$2:$B$13',
        'line':       {'color': 'red'},
    })


    chart.set_x_axis({
        'name': '游戏名称',
        'name_font': {'size':14,'bold':True},
    })

    chart.set_size({'width':720,'height':576})
    chart.set_title({'name':'Game Progrom download'})




    workbook.close()

    f.close()
    os.remove('./out.txt')



except urllib2.URLError, e:
    if hasattr(e,"code"):
        print e.code
    if hasattr(e,"reason"):
        print e.reason

