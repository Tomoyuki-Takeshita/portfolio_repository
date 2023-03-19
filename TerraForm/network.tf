# VPC
resource "aws_vpc" "Vpc" {
  cidr_block           = var.vpc.vpc_cidr_block
  enable_dns_hostnames = var.vpc.enable_dns_hostnames
  enable_dns_support   = var.vpc.enable_dns_support
  tags = {
    Name = "${var.project_prefix}-${var.vpc.tagname}"
  }
}

# インテーネットゲートウェイ
resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.Vpc.id
  tags = {
    Name = "${var.project_prefix}-${var.igw_tagname}"
  }
}

# パブリックサブネット
resource "aws_subnet" "PublicSubnet" {
  for_each                = var.public_subnet

  vpc_id                  = aws_vpc.Vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.zone
  map_public_ip_on_launch = each.value.launch
  tags = {
    Name = "${var.project_prefix}-${each.value.tagname}"
  }
}

# プライベートサブネット
resource "aws_subnet" "PrivateSubnet" {
  for_each                = var.private_subnet

  vpc_id                  = aws_vpc.Vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.zone
  map_public_ip_on_launch = each.value.launch
  tags = {
    Name = "${var.project_prefix}-${each.value.tagname}"
  }
}

# パブリックルートテーブル
resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.Vpc.id
  route {
    gateway_id = aws_internet_gateway.Igw.id
    cidr_block = var.public_route_table.cidr
  }
  tags = {
    Name = "${var.project_prefix}-${var.public_route_table.tagname}"
  }
}

# プライベートルートテーブル
resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = aws_vpc.Vpc.id
  tags = {
    Name = "${var.project_prefix}-${var.private_route_table.tagname}"
  }
}

# パブリックルートテーブルとパブリックサブネットの関連付け
resource "aws_route_table_association" "Public1aRouteTableAssoc" {
  for_each = var.public_subnet

  route_table_id = aws_route_table.PublicRouteTable.id
  subnet_id      = aws_subnet.PublicSubnet[each.key].id
}

# プライベートルートテーブルとプライベートサブネットの関連付け
resource "aws_route_table_association" "Private1aRouteTableAssoc" {
  for_each = var.private_subnet

  route_table_id = aws_route_table.PrivateRouteTable.id
  subnet_id      = aws_subnet.PrivateSubnet[each.key].id
}
