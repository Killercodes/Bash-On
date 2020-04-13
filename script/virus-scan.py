  GNU nano 4.9.2                                                                         virusScan.py.bak
#!/usr/bin/python
# -*- coding: utf-8 -*-
import re
import httplib
import time
import os
import optparse
from urlparse import urlparse


def printResults(url):

    status = 200
    host = urlparse(url)[1]
    path = urlparse(url)[2]

    if 'analysis' not in path:
        while status != 302:
            conn = httplib.HTTPConnection(host)
            conn.request('GET', path)
            resp = conn.getresponse()
            status = resp.status
            print '[+] Scanning file...'
            conn.close()
            time.sleep(15)

    print '[+] Scan Complete.'
    path = path.replace('file', 'analysis')
    conn = httplib.HTTPConnection(host)
    conn.request('GET', path)
    resp = conn.getresponse()
    data = resp.read()
    conn.close()

    reResults = re.findall(r'Detection rate:.*\)', data)
    htmlStripRes = reResults[1].\
      replace('&lt;font color=\'red\'&gt;', '').\
      replace('&lt;/font&gt;', '')
    print '[+] ' + str(htmlStripRes)
