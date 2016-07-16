#!/usr/bin/python

import wolframalpha
import sys
import urllib.parse
import re

client = wolframalpha.Client('J8846W-HTH5QKVJVE')

query = ' '.join(sys.argv[1:])

res = client.query(query)

texts = ""

if len(res.pods) > 0:
        pod = res.pods[1]
        if pod.text:
                texts = pod.text
        else:
                texts = "I have no answer for that"
else:
        texts = "Sorry I am not sure"

print(texts)
texts = re.sub('[^A-Za-z0-9]+', '%20', texts)


file = open("result.txt", "w")
file.write(texts)