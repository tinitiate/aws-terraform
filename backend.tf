terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}


# terraform {
#   backend "s3" {
#     bucket         = "tinitiate-d-iac-001"
#     key            = "terraform.tfstate"
#     region         = "us-east-2"  # Update with your desired region
#     encrypt        = true
#     dynamodb_table = "terraform_locks"
#   }
# }