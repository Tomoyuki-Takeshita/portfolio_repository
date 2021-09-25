# VPC
output "vpc_id" {
  value = aws_vpc.Vpc.id
}

# パブリックサブネット1a
output "public_subnet1a_id" {
  value = aws_subnet.PublicSubnet["public1a"].id
}

# パブリックサブネット1c
output "public_subnet1c_id" {
  value = aws_subnet.PublicSubnet["public1c"].id
}

# プライベートサブネット1a
output "private_subnet1a_id" {
  value = aws_subnet.PrivateSubnet["private1a"].id
}

# プライベートサブネット1c
output "private_subnet1c_id" {
  value = aws_subnet.PrivateSubnet["private1c"].id
}

# ec2セキュリティグループ
output "Ec2Sg_id" {
  value = aws_security_group.Ec2Sg.id
}