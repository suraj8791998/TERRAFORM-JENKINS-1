resource "aws_security_group" "jenkins" {
  name        = "Jenkins"
  description = "Jenkins security group"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "Jenkins-security group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_01" {
  security_group_id = aws_security_group.jenkins.id
  cidr_ipv4         = data.aws_vpc.default.id
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ingress_02" {
  security_group_id = aws_security_group.jenkins.id
  cidr_ipv4         = data.aws_vpc.default.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "ingress_03" {
  security_group_id = aws_security_group.jenkins.id
  cidr_ipv4         = data.aws_vpc.default.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "ingress_04" {
  security_group_id = aws_security_group.jenkins.id
  cidr_ipv4         = data.aws_vpc.default.id
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}
resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.jenkins.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_instance" "ec2_creation" {
  ami           = data.aws_ami.ami_id.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.jenkins.id]

  tags = {
    Name = "Jenkins-server"
  }
}

