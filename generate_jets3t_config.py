#!/usr/bin/python

import sys
import os

secret_key = os.environ.get("AWS_SECRET_KEY")
access_key = os.environ.get("AWS_ACCESS_KEY")

if secret_key == None or access_key == None :
  exit()

tempalte = open('./jets3t_template.xml').read()

print tempalte.format( secret_key = secret_key, access_key = access_key )
