resource "aws_s3_bucket" "b" {
  bucket = "s3-website-test.hashicorp.com"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "allow_tls" {
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["127.2.3.4/32"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }
}

resource "aws_instance" "web2" {
  count = 2

  ami           = "data.aws_ami.ubuntu.id"
  instance_type = "t2.micro"

  network_interface {
    device_index         = 0
    network_interface_id = ""
  }

  lifecycle {
    create_before_destroy = true
  }
}
