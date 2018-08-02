#!/usr/bin/python

import smtplib

sender = 'hapmap2@hapmap2-webservices.com'
receivers = ['jclogorda@gmail.com']

message = """From: From Person <{}>
To: To Person <{}>
Subject: SMTP e-mail test

This is a test e-mail message.
""".format(sender, receivers)

try:
   smtpObj = smtplib.SMTP('localhost')
   smtpObj.sendmail(sender, receivers, message)         
   print("Successfully sent email")
except SMTPException:
   print("Error: unable to send email")
