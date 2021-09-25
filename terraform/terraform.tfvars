## 全体
# 頭文字の指定
project_prefix = "test"

## provider.tf
# リージョンとプロファイルの指定
aws_config = {
  aws_region = "ap-northeast-1"
  profile    = "take"
}

## network.tf
# VPC
vpc = {
  vpc_cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  tagname              = "vpc"
}

# インテーネットゲートウェイの名前
igw_tagname = "igw"

# パブリックサブネット
public_subnet = {
  public1a = {
    cidr    = "10.0.0.0/24"
    zone    = "ap-northeast-1a"
    launch  = "true"
    tagname = "Public1a"
  }
  public1c = {
    cidr    = "10.0.1.0/24"
    zone    = "ap-northeast-1c"
    launch  = "true"
    tagname = "Public1c"
  }
}

# プライベートサブネット
private_subnet = {
  private1a = {
    cidr    = "10.0.2.0/24"
    zone    = "ap-northeast-1a"
    launch  = "false"
    tagname = "Private1a"
  }
  private1c = {
    cidr    = "10.0.3.0/24"
    zone    = "ap-northeast-1c"
    launch  = "false"
    tagname = "Private1c"
  }
}

# パブリックルートテーブル
public_route_table = {
  cidr    = "0.0.0.0/0"
  tagname = "PublicRouteTable"
}

# プライベートルートテーブル
private_route_table = {
  tagname = "PrivateRouteTable"
}

### ec2_alb.tf
## ALBセキュリティグループ
alb_sg = {
  name        = "AlbSg"
  description = "This is AlbSg"
  tagname     = "AlbSg"
}

# インバウンドルール
alb_sg_ingrees_cidr_blocks = ["0.0.0.0/0"]

alb_sg_ingrees_port = [80, 443]

## ALB
alb = {
  name         = "alb"
  internal     = "false"
  idle_timeout = "60"
  tagname      = "alb"
}

alb_target_group = {
  name                = "alb"
  protocol            = "HTTP"
  port                = "80"
  path                = "/"
  healthy_threshold   = "5"
  unhealthy_threshold = "2"
  timeout             = "5"
  interval            = "30"
  matcher             = "200"
}

ec2_config = {
  webserver1a = {
    ami                                  = "ami-06098fd00463352b6"
    instance_type                        = "t2.micro"
    availability_zone                    = "ap-northeast-1a"
    subnet_id                            = "public1a"
    key_name                             = "win02-key"
    associate_public_ip_address          = "true"
    instance_initiated_shutdown_behavior = "stop"
    disable_api_termination              = false
    monitoring                           = false
    volume_type                          = "gp2"
    volume_size                          = "8"
    public_ip                            = "18.178.65.247"
    tagname                              = "server-1a"
  }
  webserver1c = {
    ami                                  = "ami-06098fd00463352b6"
    instance_type                        = "t2.micro"
    availability_zone                    = "ap-northeast-1c"
    subnet_id                            = "public1c"
    key_name                             = "win02-key"
    associate_public_ip_address          = "true"
    instance_initiated_shutdown_behavior = "stop"
    disable_api_termination              = false
    monitoring                           = false
    volume_type                          = "gp2"
    volume_size                          = "8"
    public_ip                            = "35.73.229.77"
    tagname                              = "server-1c"
  }
}

## EC2セキュリティグループ
ec2_sg = {
  name        = "Ec2Sg"
  description = "This is Ec2Sg"
  tagname     = "Ec2Sg"
}

# インバウンドルール
ec2_sg_ingrees_port = [80, 443]

## RDSセキュリティグループ
rds_sg = {
  name        = "RdsSg"
  description = "This is RdsSg"
  tagname     = "RdsSg"
}

# インバウンドルール
rds_sg_inbound = {
  from_port = 3306
  to_port   = 3306
  protocol  = "tcp"
}

# RDS
rds_config = {
  engine                      = "mysql"
  engine_version              = "8.0.20"
  instance_class              = "db.t2.micro"
  identifier                  = "rds-mysql"
  storage_type                = "gp2"
  allocated_storage           = "20"
  name                        = "detabase"
  publicly_accessible         = false
  multi_az                    = false
  auto_minor_version_upgrade  = true
  allow_major_version_upgrade = false
  backup_retention_period     = "1"
  copy_tags_to_snapshot       = false
  monitoring_interval         = "0"
  parameter_group_name        = "default.mysql8.0"
  option_group_name           = "default:mysql-8-0"
  port                        = "3306"
  skip_final_snapshot         = false
  final_snapshot_identifier   = "snapshot-01"
  db_subnet_gropu_name        = "subnet-group"
  tagname                     = "rds-mysql"
}