#!/usr/bin/python

import smtplib
import re
import dns.resolver
import socket
from email.mime.text import MIMEText


VALID = '^[_a-z0-9-]+(\.[_a-z0-9-]+)*' + \
        '@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$'


def check_syntax(check_me):
    '''Validates email address provided for proper syntax'''
    valid = re.match(VALID, check_me)  # does it contain valid characters?
    if not valid:
        return False
    return True


def check_DNS(check_me):
    '''Uses dnspython to valide domain'''
    try:
        answers = dns.resolver.query(check_me, 'MX')
        mx_record = answers[0].exchange
        mx_record = str(mx_record)
        return mx_record
    except dns.resolver.NXDOMAIN:
        print('Host {} does not exist'.format(check_me))
        return False
    except dns.resolver.Timeout:
        print('Timed out while resolving')
        return False
    except dns.exception.DNSException:
        print('Unhandled exception')
        return False


def send_test(test_me, mx_record):
    '''sends test to email test_me and checks for 250 return code'''
    server = smtplib.SMTP()
    server.connect(mx_record)
    host = socket.gethostname()
    server.helo(host)
    server.mail('foooo@ncgr.org')
    code, message = server.rcpt(test_me)
    server.quit()
    if code == 250:  #successful contact
        return True
    print(code)
    print(message)
    print(mx_record)
    return False


def validate_email(check_me):
    '''Screens and validates email address'''
    if not check_syntax(check_me):  # validate syntax
        return False
    check_me = str(check_me)
    domain = check_me.split('@')[-1]
    mx_record = check_DNS(domain)
    if not mx_record:  # validate DNS
        print('no MX record for {}'.format(check_me))
        return False
    if not send_test(check_me, mx_record):  # send test against mx
        print('Send Test did not Validate')
        return False
    return True


def hapmap2_mailer(sender, receivers, subject, message):
    '''Sends mail to parites involved in Germplasm preservation'''
    msg = MIMEText(message)  # cast message as correct type
    msg['Subject'] = subject
    if not validate_email(sender):  # check email
        print('Could not validate content')
        return False
    msg['From'] = sender
    msg['To'] = ", ".join(receivers)  # list of germplasm recipients
    try:
        smtpObj = smtplib.SMTP('localhost')
        smtpObj.sendmail(sender, receivers, msg.as_string())
        print('EMAIL SENT')
        return True
    except SMTPException:
        raise


if __name__ == '__main__':
    hapmap2_mailer('ctc@ncgr.org', ['ctc@ncgr.org'], 'test me', 'STUFFF')
