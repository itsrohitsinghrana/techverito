variable "aws_region" {
  description = "The region where AWS operations will take place"
}

variable "ami_id_1" {
  description = "AMI ID for the first instance"
}

variable "ami_id_2" {
  description = "AMI ID for the second instance"
}

variable "instance_type" {
  description = "Instance type for both instances"
}
