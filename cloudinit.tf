data "template_file" "jenkins-init" {
  #This is the script to initialize the Jenkins Instance, all installations of dependencies
  #etc. on the remote instance on AWS.
  template = file("scripts/jenkins-init.sh")
 
  #The variables which are passed into the template above. We point to the versions we want.
  vars = {
    DEVICE            = var.INSTANCE_DEVICE_NAME
  }
}

data "template_cloudinit_config" "cloudinit-jenkins" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.jenkins-init.rendered
  }
}