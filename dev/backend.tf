terraform {
  backend "s3" {
    bucket         = "tf-backend-demo-project"
    key            = "terraform/state/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "tf-lock-demo-app"
    encrypt        = true
    role_arn       = "arn:aws:iam::730335465971:role/terraform-role"
  }
}