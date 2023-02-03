resource "aws_vpc" "vpc_res_1" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "first_vpc"
  }
}

resource "aws_subnet" "Pub_subet_res_1" {
  vpc_id                  = aws_vpc.vpc_res_1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    "Name" = "First_pub_subnet"
  }

}

resource "aws_subnet" "Pub_subet_res_2" {
  vpc_id                  = aws_vpc.vpc_res_1.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"
  tags = {
    "Name" = "Fecond_pub_subnet"
  }

}
resource "aws_subnet" "Pub_subet_res_3" {
  vpc_id                  = aws_vpc.vpc_res_1.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"
  tags = {
    "Name" = "Third_pub_subnet"
  }

}

resource "aws_subnet" "Pri_subet_res_1" {
  vpc_id                  = aws_vpc.vpc_res_1.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    "Name" = "First_pri_subnet"
  }

}

resource "aws_subnet" "Pri_subet_res_2" {
  vpc_id                  = aws_vpc.vpc_res_1.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"
  tags = {
    "Name" = "Second_pri_subnet"
  }

}

resource "aws_subnet" "Pri_subet_res_3" {
  vpc_id                  = aws_vpc.vpc_res_1.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"
  tags = {
    "Name" = "Third_pri_subnet"
  }

}

resource "aws_internet_gateway" "First_IGW" {
  vpc_id = aws_vpc.vpc_res_1.id
  tags = {
    Name = "dove-IGW"
  }

}
resource "aws_route_table" "First_Route_table" {
  vpc_id = aws_vpc.vpc_res_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.First_IGW.id
  }
  tags = {
    "Name" = "First_RT"
  }
}

resource "aws_route_table_association" "for_Pub_subnet1" {
  subnet_id      = aws_subnet.Pub_subet_res_1.id
  route_table_id = aws_route_table.First_Route_table.id
}

resource "aws_route_table_association" "for_Pub_subnet2" {
  subnet_id      = aws_subnet.Pub_subet_res_2.id
  route_table_id = aws_route_table.First_Route_table.id
}
resource "aws_route_table_association" "for_Pub_subnet3" {
  subnet_id      = aws_subnet.Pub_subet_res_3.id
  route_table_id = aws_route_table.First_Route_table.id
}