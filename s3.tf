resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-state-bob347dylan"
    acl = "private"

    tags = {
        Name = "Terraform state"
    }
}