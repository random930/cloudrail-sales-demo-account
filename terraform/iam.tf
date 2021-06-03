# This is the user Terraform is using to run
resource "aws_iam_user" "terraform" {
  name = "terraform"
}

# Billing users
resource "aws_iam_group" "billing" {
  name = "billing"
  path = "/humans/"
}

resource "aws_iam_group_policy_attachment" "billing_policy_attachment" {
  group       = aws_iam_group.billing.name
  policy_arn = "Billing"
}

module "dc_sands" {
  source = "cloudposse/iam-user/aws"
  version     = "0.7.0"
  name      = "dc_sands"
  user_name = "dc_sands"
  pgp_key    = "keybase:cloudrail_sales"
  groups    = ["/humans/billing"]

  tags = {
    "department" = "g_and_a"
  }
}


# Tech demo users
resource "aws_iam_group_policy_attachment" "tech_demo_policy_attachment" {
  group       = aws_iam_group.tech_demo.name
  policy_arn = "AdministratorAccess"
}

resource "aws_iam_group" "tech_demo" {
  name = "tech_demo"
  path = "/humans/"
}

module "stephen_archer" {
  source = "cloudposse/iam-user/aws"
  version     = "0.7.0"
  name      = "stephen_archer"
  user_name = "stephen_archer"
  pgp_key    = "keybase:cloudrail_sales"
  groups    = ["/humans/tech_demo"]

  tags = {
    "department" = "sales"
  }
}

module "charles_kim" {
  source = "cloudposse/iam-user/aws"
  version     = "0.7.0"
  name      = "charles_kim"
  user_name = "charles_kim"
  pgp_key    = "keybase:cloudrail_sales"
  groups    = ["/humans/tech_demo"]

  tags = {
    "department" = "sales"
  }
}

module "yoni_leitersdorf" {
  source = "cloudposse/iam-user/aws"
  version     = "0.7.0"
  name      = "yoni_leitersdorf"
  user_name = "yoni_leitersdorf"
  pgp_key    = "keybase:cloudrail_sales"
  groups    = ["/humans/tech_demo"]

  tags = {
    "department" = "sales"
  }
}