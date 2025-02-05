# Python code for sending Email notifications

import json

def lambda_handler(event, context):
    # Process the event and send email notification
    # This is a stub function; integrate with SES or another email service as needed.
    response = {
        "statusCode": 200,
        "body": json.dumps("Email notification sent!")
    }
    return response
