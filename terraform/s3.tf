resource "aws_s3_bucket" "resume" {
  bucket = var.bucket_name
}

# Bucket owns uploaded files
resource "aws_s3_bucket_ownership_controls" "resume" {
  bucket = aws_s3_bucket.resume.id
  rule {

    object_ownership = "BucketOwnerPreferred"
  }

}

# Disabling public access to the bucket
resource "aws_s3_bucket_public_access_block" "resume" {
  bucket = aws_s3_bucket.resume.id

  block_public_acls  = true
  ignore_public_acls = true

  block_public_policy     = true
  restrict_public_buckets = true
}

# Activating versioning
resource "aws_s3_bucket_versioning" "resume" {
  bucket = aws_s3_bucket.resume.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Uploading objects from website folder
resource "aws_s3_object" "website_files" {
  for_each = local.website_files
  bucket   = aws_s3_bucket.resume.id
  key      = each.value
  source   = "${path.module}/../website/${each.value}"
  etag     = filemd5("${path.module}/../website/${each.value}")

  # Tell apart between the diferent types to interact nicely with the webpage
  content_type = lookup(
    {
      "html" = "text/html"
      "css"  = "text/css"
      "js"   = "application/javascript"
      "png"  = "image/png"
      "jpg"  = "image/jpeg"
      "jpeg" = "image/jpeg"
      "svg"  = "image/svg+xml"
    },
    # Extract the extension
    element(split(".", each.value), length(split(".", each.value)) - 1),
    # Default value
    "application/octet-stream"
  )
}
