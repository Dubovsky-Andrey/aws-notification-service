/*
This module creates an S3 bucket configured for static website hosting.
It hosts a simple website with a button to trigger a notification send action.
*/

resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.project_name}-${var.environment}-website"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.website_bucket.bucket
  key          = "index.html"
  content      = <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Notification Platform</title>
</head>
<body>
    <h1>Notification Platform</h1>
    <button onclick="sendNotification()">Send Notification</button>
    <script>
        function sendNotification() {
            // Call the API Gateway endpoint to trigger an Email notification
            const apiEndpoint = "${var.api_endpoint}";
            fetch(apiEndpoint + "sendEmail", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ message: "Test notification" })
            })
            .then(response => response.json())
            .then(data => alert("Response: " + JSON.stringify(data)))
            .catch(error => alert("Error: " + error));
        }
    </script>
</body>
</html>
EOF
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.website_bucket.bucket
  key          = "error.html"
  content      = "<html><body><h1>Error occurred.</h1></body></html>"
  content_type = "text/html"
}
