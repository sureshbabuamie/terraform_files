resource "aws_key_pair" "name_of_key_resource" {
  key_name   = "mykey.pem"
  public_key = file("mykey.pub")

}
resource "aws_instance" "name_of_ins_resource" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  subnet_id = aws_subnet.Pub_subet_res_1.id
  key_name               = "mykey.pem"
  vpc_security_group_ids = [aws_security_group.First_sec_group.id]
  tags = {
    Name    = "Tera_instance_Web"
    Project = "Tera"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [

      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]

  }
  connection {
    type        = "ssh"
    user        = var.USER
    private_key = file("mykey.pem")
    host        = self.public_ip
  }
}
output "ip_details" {
  value = aws_instance.name_of_ins_resource.public_ip
}
