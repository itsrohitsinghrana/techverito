variable "instance_configurations" {
  description = "Configurations for EC2 instances"
  type = map(object({
    ami_id         = string
    instance_type  = string
    tags           = map(string)
    key_name       = string
    user_data_file = string
  }))

  default = {
    jenkins = {
      ami_id         = "ami-xxxxxxxxxxxx"
      instance_type  = "t2.micro"
      tags           = { Name = "jenkins-server" }
      key_name       = "jenkins_key"
      user_data_file = "scripts/jenkins_setup.sh"
    },
    deployment = {
      ami_id         = "ami-yyyyyyyyyyyy"
      instance_type  = "t2.micro"
      tags           = { Name = "deployment-server" }
      key_name       = "deployment_key"
      user_data_file = "scripts/deployment_setup.sh"
    }
  }
}
