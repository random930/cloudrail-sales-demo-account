 # You cannot create a new backend by simply defining this and then
 # immediately proceeding to "terraform apply". The S3 backend must
 # be bootstrapped according to the simple yet essential procedure in
 # https://github.com/cloudposse/terraform-aws-tfstate-backend#usage
 module "terraform_state_backend" {
   source = "cloudposse/tfstate-backend/aws"
   version     = "0.33.0"
   namespace  = "eg"
   stage      = "test"
   name       = "cloudrail-sales-demo-tf-backend"
   attributes = ["state"]

   terraform_backend_config_file_path = "."
   terraform_backend_config_file_name = "backend.tf"
   force_destroy                      = false
 }
