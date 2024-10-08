resource "aws_eip" "eip_for_nat_gateway_az1" {
  
  domain   = "vpc"
}

resource "aws_eip" "eip_for_nat_gateway_az2" {

  domain   = "vpc"
}

resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = var.public_subnet_az1_id
  tags = {
    Name = "gw NAT 1"
  }

  depends_on = [var.internet_gateway_id]
}

resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id     = var.public_subnet_az2_id

  tags = {
    Name = "gw NAT 2"
  }


  depends_on = [var.internet_gateway_id]
}


resource "aws_route_table" "private_route_table_az1" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }


  tags = {
    Name = "private route table az1"
  }
}

resource "aws_route_table_association" "private_az1_route_table_association" {
  subnet_id      = var.private_subnet_az1_id
  route_table_id = aws_route_table.private_route_table_az1.id
}



resource "aws_route_table" "private_route_table_az2" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }


  tags = {
    Name = "private route table az2"
  }
}


resource "aws_route_table_association" "private_az2_route_table_association" {
  subnet_id      = var.private_subnet_az2_id
  route_table_id = aws_route_table.private_route_table_az2.id
}
