# This is the user Terraform is using to run
resource "aws_iam_user" "terraform" {
  name = "terraform"
}

# A billing user for DC Sands (runs US ops)
resource "aws_iam_user" "dc" {
  name = "terraform"
}

resource "aws_iam_user_policy_attachment" "billing-policy-attachment" {
  user       = aws_iam_user.dc.name
  policy_arn = "Billing"
}
