resource "aws_key_pair" "my-ecs-keys" {
    key_name = var.PATH_TO_PRIVATE_KEY
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}