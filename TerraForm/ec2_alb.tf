## ALBセキュリティグループ
resource "aws_security_group" "AlbSg" {
  vpc_id      = aws_vpc.Vpc.id
  name        = var.alb_sg.name
  description = var.alb_sg.description
  tags = {
    Name = "${var.project_prefix}-${var.alb_sg.tagname}"
  }
}

# インバウンドルール
resource "aws_security_group_rule" "AlbSgIngrees" {
  for_each          = var.alb_sg_ingrees_port

  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = var.alb_sg_ingrees_cidr_blocks
  security_group_id = aws_security_group.AlbSg.id
}

# アウトバウンドルール
resource "aws_security_group_rule" "AlbSgEgrees" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.AlbSg.id
}

## ALB
resource "aws_lb" "Alb" {
  load_balancer_type = "application"
  name               = "${var.project_prefix}-${var.alb.name}"
  internal           = var.alb.internal
  idle_timeout       = var.alb.idle_timeout
  security_groups = [
    aws_security_group.AlbSg.id
  ]
  subnets = [
    aws_subnet.PublicSubnet["public1a"].id,
    aws_subnet.PublicSubnet["public1c"].id
  ]
  tags = {
    Name = "${var.project_prefix}-${var.alb.tagname}"
  }
}

# ターゲットグループ
resource "aws_lb_target_group" "AlbTargetGroup" {
  name     = "${var.project_prefix}-${var.alb_target_group.name}"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.Vpc.id
  health_check {
    protocol            = var.alb_target_group.protocol
    port                = var.alb_target_group.port
    path                = var.alb_target_group.path
    healthy_threshold   = var.alb_target_group.healthy_threshold
    unhealthy_threshold = var.alb_target_group.unhealthy_threshold
    timeout             = var.alb_target_group.timeout
    interval            = var.alb_target_group.interval
    matcher             = var.alb_target_group.matcher
  }
}

resource "aws_lb_target_group_attachment" "AlbAttach" {
  for_each         = var.ec2_config
  target_group_arn = aws_lb_target_group.AlbTargetGroup.arn
  port             = "80"
  target_id        = aws_instance.EC2[each.key].id
}

# リスナー
resource "aws_lb_listener" "AlbListener" {
  load_balancer_arn = aws_lb.Alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.AlbTargetGroup.arn
  }
}

## EC2
resource "aws_instance" "EC2" {
  for_each                             = var.ec2_config

  ami                                  = each.value.ami
  instance_type                        = each.value.instance_type
  availability_zone                    = each.value.availability_zone
  subnet_id                            = aws_subnet.PublicSubnet[each.value.subnet_id].id
  key_name                             = each.value.key_name
  associate_public_ip_address          = each.value.associate_public_ip_address
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  disable_api_termination              = each.value.disable_api_termination
  monitoring                           = each.value.monitoring
  iam_instance_profile                 = "EC2_instance_profile"
  vpc_security_group_ids = [
    aws_security_group.Ec2Sg.id
  ]
  root_block_device {
    volume_type = each.value.volume_type
    volume_size = each.value.volume_size
  }
  tags = {
    Name = "${var.project_prefix}-${each.value.tagname}"
  }
}

# 静的IPとの関連付け
resource "aws_eip_association" "ElasticIPAssociate" {
  for_each = var.ec2_config

  public_ip   = each.value.public_ip
  instance_id = aws_instance.EC2[each.key].id
}

## EC2セキュリティグループ
resource "aws_security_group" "Ec2Sg" {
  vpc_id      = aws_vpc.Vpc.id
  name        = var.ec2_sg.name
  description = var.ec2_sg.description
  tags = {
    Name = "${var.project_prefix}-${var.ec2_sg.tagname}"
  }
}

# インバウンドルール
resource "aws_security_group_rule" "Ec2SgIngrees" {
  for_each                 = var.ec2_sg_ingrees_port

  type                     = "ingress"
  from_port                = each.value
  to_port                  = each.value
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.AlbSg.id
  security_group_id        = aws_security_group.Ec2Sg.id
}

# アウトバウンドルール
resource "aws_security_group_rule" "Ec2SgEgrees" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Ec2Sg.id
}

## SSH接続用 IAMロール(AWS Systems Manager)
# インスタンスプロファイルの定義
resource "aws_iam_instance_profile" "instance_profile" {
  name = "EC2_instance_profile"
  role = aws_iam_role.ssm_role.name
}

# IAMロール
resource "aws_iam_role" "ssm_role" {
  name = "EC2_ssm_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# 「AmazonSSMManagedInstanceCore」ポリシーをIAMロールに関連付け
resource "aws_iam_role_policy_attachment" "ssm_core_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}