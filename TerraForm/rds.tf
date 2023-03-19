## RDSセキュリティグループ
resource "aws_security_group" "RdsSg" {
  name        = var.rds_sg.name
  description = var.rds_sg.description
  vpc_id      = aws_vpc.Vpc.id
  tags = {
    Name = "${var.project_prefix}-${var.rds_sg.tagname}"
  }
}

# インバウンドルール
resource "aws_security_group_rule" "RdsSgIngrees" {
  type                     = "ingress"
  from_port                = var.rds_sg_inbound.from_port
  to_port                  = var.rds_sg_inbound.to_port
  protocol                 = var.rds_sg_inbound.protocol
  source_security_group_id = aws_security_group.Ec2Sg.id
  security_group_id        = aws_security_group.RdsSg.id
}

# アウトウンドルール
resource "aws_security_group_rule" "PrivateSgEgrees" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.RdsSg.id
}

## RDS
# AWS Secret Managerよりパスワードのシークレットデータを取得
data "aws_secretsmanager_secret_version" "SecretManager" {
  secret_id = "MyRDSSecret"
}

locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.SecretManager.secret_string
  )
}

# RDS設定値
resource "aws_db_instance" "RDS" {
  engine                      = var.rds_config.engine
  engine_version              = var.rds_config.engine_version
  instance_class              = var.rds_config.instance_class
  identifier                  = var.rds_config.identifier
  storage_type                = var.rds_config.storage_type
  allocated_storage           = var.rds_config.allocated_storage
  name                        = var.rds_config.name
  username                    = local.db_creds.username
  password                    = local.db_creds.password
  publicly_accessible         = var.rds_config.publicly_accessible
  multi_az                    = var.rds_config.multi_az
  auto_minor_version_upgrade  = var.rds_config.auto_minor_version_upgrade
  allow_major_version_upgrade = var.rds_config.allow_major_version_upgrade
  backup_retention_period     = var.rds_config.backup_retention_period
  copy_tags_to_snapshot       = var.rds_config.copy_tags_to_snapshot
  monitoring_interval         = var.rds_config.monitoring_interval
  parameter_group_name        = var.rds_config.parameter_group_name
  option_group_name           = var.rds_config.option_group_name
  port                        = var.rds_config.port
  skip_final_snapshot         = var.rds_config.skip_final_snapshot
  final_snapshot_identifier   = var.rds_config.final_snapshot_identifier
  db_subnet_group_name        = aws_db_subnet_group.RdsSubnetGroup.name
  vpc_security_group_ids = [
    aws_security_group.RdsSg.id
  ]
  tags = {
    Name = "${var.project_prefix}-${var.rds_config.tagname}"
  }
}

# RDSサブネットグループ
resource "aws_db_subnet_group" "RdsSubnetGroup" {
  name = var.rds_config.db_subnet_gropu_name
  subnet_ids = [
    aws_subnet.PrivateSubnet["private1a"].id,
    aws_subnet.PrivateSubnet["private1c"].id
  ]
  tags = {
    Name = "${var.project_prefix}-${var.rds_config.db_subnet_gropu_name}"
  }
}