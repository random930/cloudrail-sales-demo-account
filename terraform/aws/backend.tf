terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "eg-test-cloudrail-sales-demo-tf-backend-state"
    key            = "terraform.tfstate"
    dynamodb_table = "eg-test-cloudrail-sales-demo-tf-backend-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
