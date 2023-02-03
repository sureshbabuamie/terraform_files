resource "aws_security_group" "First_sec_group" {
    vpc_id = aws_vpc.vpc_res_1.id
    name = "terraform_sg"
    description = "to hold the instance from terraform"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.MYIP_1]

    }
    tags = {
        Name = "allow-ssh"
    }
  
}