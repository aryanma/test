provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "bad_example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  # No tags
  # No EBS encryption
  # Hardcoded AMI
  # No user_data for security updates
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "my-public-bucket-demo"
  acl    = "public-read"

  versioning {
    enabled = false
  }

  # No server-side encryption
  # Public access
}

resource "aws_security_group" "open_sg" {
  name        = "open-sg"
  description = "Security group with open ingress"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_s3_bucket" "demo_bucket" { bucket = "my-demo-bucket-123" acl = "public-read" # No server-side encryption # No versioning }
