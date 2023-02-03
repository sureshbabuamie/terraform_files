variable "REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-08e637cea2f053dfa"
  }
}
variable "USER" {
  default = "ec2-user"
}
variable "MYIP_1" {
    default = ""
  
}
