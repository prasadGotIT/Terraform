resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow-allways.id]
    tags = local.ec2_tags
}
resource "aws_security_group" "allow-allways" {
    name = "${local.common_name}-allow-allways"

    egress {
    from_port        = var.egress_from_port # from port 0 to to port 0 means all ports
    to_port          = var.egress_to_port 
    protocol         = var.protocol # -1 means all protocols
    cidr_blocks      = var.cidr # internet
  }

  ingress {
    from_port        = var.ingress_from_port # from port 0 to to port 0 means all ports
    to_port          = var.ingress_to_port 
    protocol         = var.protocol # -1 means all protocols
    cidr_blocks      = var.cidr # internet
  }

 tags = merge(
      var.common_tags,
      {
        Name = "${local.common_name}-local-demo"
      }
    )
} 
  
