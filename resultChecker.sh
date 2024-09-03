#!/bin/bash

# URL to fetch data from
URL="https://dev.to/search/feed_content?per_page=50&page=0&tag=nylaschallenge&sort_by=hotness_score&sort_direction=desc&tag_names%5B%5D=nylaschallenge&approved=&class_name=Article"

# Fetch JSON data
response=$(curl -s "$URL")

# Count the occurrences of "title":
title_count=$(echo "$response" | grep -o '"title":' | wc -l)

# Check the count and respond accordingly
if [ "$title_count" -eq 45 ]; then
  echo "Result not published"
  # Send a message via WhatsApp using Twilio API or similar service
  # Replace <TWILIO_SID>, <TWILIO_AUTH_TOKEN>, <FROM_NUMBER>, <TO_NUMBER>, and <MESSAGE> with actual values
  curl -X POST "https://api.twilio.com/2010-04-01/Accounts/ACc2aec41087fd6b2678523786129266a9/Messages.json" \
       --data-urlencode "Body=Results Not published!" \
       --data-urlencode "From=+19784044269" \
       --data-urlencode "To=+919095315305" \
       -u "ACc2aec41087fd6b2678523786129266a9:0c59bea2c267eee6fc7a40c22afd2995"
else
  echo "Results out!"
  # Send a message via WhatsApp using Twilio API or similar service
  # Replace <TWILIO_SID>, <TWILIO_AUTH_TOKEN>, <FROM_NUMBER>, <TO_NUMBER>, and <MESSAGE> with actual values
  curl -X POST "https://api.twilio.com/2010-04-01/Accounts/<TWILIO_SID>/Messages.json" \
       --data-urlencode "Body=Results out!" \
       --data-urlencode "From=<FROM_NUMBER>" \
       --data-urlencode "To=<TO_NUMBER>" \
       -u "<TWILIO_SID>:<TWILIO_AUTH_TOKEN>"
fi
