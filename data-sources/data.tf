data "aws_ami" "devops" {
    owners = ["973714476881"]
    most_recent = true

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
       name = "root-device-type"
       values = ["ebs"]
    }

    filter {
      name = "virtulization-type"
      values = ["hvm"]
    
    }
  
}
output "ami_id" {

    value = data.aws_ami.devops.id
  
}

data "aws_instance" "terraform" {
       
       instance_id = "i-0bb0d489a0d24e7df"

}

output "terraform_info"{
    value = data.aws_instance.terraform
}