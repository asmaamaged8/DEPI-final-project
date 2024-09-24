

resource "aws_instance" "public_ec2_az1" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_az1_id
  security_groups = [var.pub_security_group_id]

  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  tags = {
    Name = "${var.project_name}-public_ec2_az1"

  }

  user_data = file("userdata.sh")
}


resource "aws_instance" "public_ec2_az2" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_az2_id
  security_groups = [var.pub_security_group_id]

  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  tags = {
    Name = "${var.project_name}-public_ec2_az2"

  }

  
}


resource "aws_instance" "private_ec2_az1" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_az1_id
  security_groups = [var.priv_security_group_id]

  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  tags = {
    Name = "${var.project_name}-private_ec2_az1"

  }
}


resource "aws_instance" "private_ec2_az2" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_az2_id
  security_groups = [var.priv_security_group_id]

  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  tags = {
    Name = "${var.project_name}-private_ec2_az2"

  }
}


