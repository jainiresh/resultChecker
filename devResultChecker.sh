#!/bin/bash

# URL to fetch data from
URL="https://dev.to/search/feed_content?per_page=50&page=0&tag=nylaschallenge&sort_by=hotness_score&sort_direction=desc&tag_names%5B%5D=nylaschallenge&approved=&class_name=Article"

# Fetch JSON data
response=$(curl -s "$URL")

# Count the occurrences of "title":
title_count=$(echo "$response" | grep -o '"title":' | wc -l)

# Email configuration
EMAIL_SUBJECT="RESULTS ARE OUT !"
EMAIL_TO="jainireshj@gmail.com"
EMAIL_BODY="The count of titles is $title_count. Please check the results."

# Check the count and respond accordingly
if [ "$title_count" -ne 45 ]; then
  echo "$EMAIL_BODY" | python3 - <<END
import smtplib
from email.mime.text import MIMEText

# Email configuration
smtp_server = 'smtp.gmail.com'
smtp_port = 587
smtp_user = 'nireshpandian19@gmail.com'
smtp_password = 'dlha cpkh ysji mytw'
sender_email = smtp_user
receiver_email = '$EMAIL_TO'

# Email content
subject = '$EMAIL_SUBJECT'
body = '$EMAIL_BODY'

# Create the email message
msg = MIMEText(body)
msg['Subject'] = subject
msg['From'] = sender_email
msg['To'] = receiver_email

# Send the email
try:
    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()  # Upgrade the connection to a secure encrypted SSL/TLS connection
        server.login(smtp_user, smtp_password)
        server.sendmail(sender_email, receiver_email, msg.as_string())
    print("Notification email sent.")
except Exception as e:
    print(f"Failed to send email: {e}")
END
else
  echo "Results not published!"
fi
