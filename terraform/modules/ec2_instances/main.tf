
resource "aws_key_pair" "deployment_key_pair" {
  key_name   = "deployment_key"
  public_key = file("${path.module}/scripts/pem_key/deployment_key.pem.pub")
}

resource "aws_key_pair" "jenkins_key_pair" {
  key_name   = "jenkins_key"
  public_key = file("${path.module}/scripts/pem_key/jenkins_key.pem.pub")
}

resource "aws_instance" "instance" {
  for_each = var.instance_configurations

  ami           = each.value.ami_id
  instance_type = each.value.instance_type
  tags          = each.value.tags

  key_name = each.value.key_name
  user_data     = file(each.value.user_data_file)
  
}
