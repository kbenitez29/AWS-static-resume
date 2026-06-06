data "aws_iam_policy_document" "cloudfront_access" {
  statement {
    actions = [
      "s3:GetObject"
    ]

    resources = [

      "${aws_s3_bucket.resume.arn}/*"
    ]

    principals {
      type = "Service"

      identifiers = [
        "cloudfront.amazonaws.com"
      ]
    }

    condition {
      test = "StringEquals"

      variable = "AWS:SourceArn"

      values = [
        aws_cloudfront_distribution.resume.arn
      ]
    }

  }
}

resource "aws_s3_bucket_policy" "resume" {
  bucket = aws_s3_bucket.resume.id

  policy = data.aws_iam_policy_document.cloudfront_access.json
}