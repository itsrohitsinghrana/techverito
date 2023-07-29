module "ec2_instances" {
  source = "./modules/ec2_instances"
  instance_configurations = {
    "instance1" = {
      ami_id        = var.ami_id_1
      instance_type = var.instance_type
      tags = {
        Name = "Jenkins-Server"
        Environment = "Production"
      }
      key_name      = "jenkins_key"
      user_data_file = "./modules/ec2_instances/scripts/jenkins.sh"  # Add this line
    }
    "instance2" = {
      ami_id        = var.ami_id_2
      instance_type = var.instance_type
      tags = {
        Name = "Deployment-Server"
        Environment = "Production"
      }
      key_name      = "deployment_key"
      user_data_file = "./modules/ec2_instances/scripts/deployment.sh"  # Add this line
    }
  }
}
