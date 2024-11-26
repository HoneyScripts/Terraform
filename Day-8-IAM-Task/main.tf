resource "aws_iam_user" "aws_iam_user" {
    name = "Honey"
  
}
resource "aws_iam_access_key" "aws_iam_access_key" {
    user = aws_iam_user.aws_iam_user.name
  
}
data "aws_iam_policy_document" "s3_full_access_policy_document" {
  statement {
    actions = [
      "s3:*" # This grants all S3 permissions
    ]

    resources = [
      "arn:aws:s3:::s3fullaccess777",    # Access to the bucket itself
      "arn:aws:s3:::s3fullaccess777/*"  # Access to all objects in the bucket
    ]
  }
}

resource "aws_iam_user_policy" "s3_full_access_policy" {
  name   = "s3-full-access"
  user   = aws_iam_user.aws_iam_user.name
  policy = data.aws_iam_policy_document.s3_full_access_policy_document.json
}
resource "aws_iam_role" "s3_full_access_role" {
  name = "Nikki"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com" # Adjust as needed (e.g., Lambda, ECS)
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  
}

# Attach the S3 Full Access Policy to the Role
resource "aws_iam_role_policy" "s3_full_access_role_policy" {
  name   = "s3-full-access-policy"
  role   = aws_iam_role.s3_full_access_role.name
  policy = data.aws_iam_policy_document.s3_full_access_policy_document.json
}