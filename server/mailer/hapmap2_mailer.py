#!/usr/bin/python

import smtplib

def hapmap2_mailer(sender, receivers, subject, message):
    '''Sends mail to parites involved in Germplasm preservation'''
    msg = MIMEText(message)  # cast message as correct type
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = ", ".join(receivers)  # list of germplasm recipients
    try:
        smtpObj = smtplib.SMTP('localhost')
        smtpObj.sendmail(sender, receivers, msg.as_string())
    except SMTPException:
        raise

