resource "aws_instance" "jenkins-instance" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
    
    vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]

    key_name = aws_key_pair.my-ecs-keys.key_name
    subnet_id = aws_subnet.main-public-1.id

    #Startup Scripts

    user_data = data.template_cloudinit_config.cloudinit-jenkins.rendered
}

#Hard Drive Space
resource "aws_ebs_volume" "jenkins-data" {
    availability_zone = "us-east-1a"
    size = 10
    type = "gp2"
    tags = {
        Name = "jenkins-data"
    }
}

#Connects the storage volume into the AWS ec2 instance
resource "aws_volume_attachment" "jenkins-data-attachment" {
    device_name = var.INSTANCE_DEVICE_NAME
    volume_id = aws_ebs_volume.jenkins-data.id
    instance_id = aws_instance.jenkins-instance.id
    skip_destroy = true   
}
