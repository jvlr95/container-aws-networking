resource "aws_subnet" "database" {
  count = length(var.database_subnets)

  vpc_id = aws_vpc.main.id

  cidr_block        = var.database_subnets[count.index].cidr
  availability_zone = var.database_subnets[count.index].availability_zone

  tags = {
    Name = var.database_subnets[count.index].name
  }

  depends_on = [
    aws_vpc_ipv4_cidr_block_association.main
  ]
}

resource "aws_network_acl" "database" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-databases", var.project_name)
  }
}

resource "aws_network_acl_rule" "allow_internal_ingress" {
  count = length(var.private_subnets)

  network_acl_id = aws_network_acl.database.id

  rule_number = 100 + count.index
  rule_action = "allow"
  protocol    = "-1"
  cidr_block  = aws_subnet.private[count.index].cidr_block

  from_port = 0
  to_port   = 0
  egress    = false
}

resource "aws_network_acl_rule" "allow_internal_egress" {
  count = length(var.private_subnets)

  network_acl_id = aws_network_acl.database.id
  rule_number    = 200 + count.index
  rule_action    = "allow"
  protocol       = "-1"
  cidr_block     = aws_subnet.private[count.index].cidr_block

  from_port = 0
  to_port   = 0
  egress    = true
}

resource "aws_network_acl_rule" "deny_all_ingress" {
  network_acl_id = aws_network_acl.database.id
  rule_number    = 300
  rule_action    = "deny"
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"

  from_port = 0
  to_port   = 0
  egress    = false
}

resource "aws_network_acl_rule" "deny_all_egress" {
  network_acl_id = aws_network_acl.database.id
  rule_number    = 301
  rule_action    = "deny"
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"

  from_port = 0
  to_port   = 0
  egress    = true
}

resource "aws_network_acl_association" "database" {
  count = length(var.database_subnets)

  network_acl_id = aws_network_acl.database.id
  subnet_id      = aws_subnet.database[count.index].id
}
