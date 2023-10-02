
#resource "aws_security_group" "default" {
#  count       = module.this.enabled && var.security_group_enabled ? 1 : 0
#  description = "Controls access to the NLB (Custom Port)"
#  vpc_id      = var.vpc_id
#  name        = module.this.id
#  tags        = module.this.tags
#}

#resource "aws_security_group_rule" "egress" {
#  count             = module.this.enabled && var.security_group_enabled ? 1 : 0
#  type              = "egress"
#  from_port         = "0"
#  to_port           = "0"
#  protocol          = "-1"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = join("", aws_security_group.default.*.id)
#}

module "access_logs" {
  source  = "cloudposse/lb-s3-bucket/aws"
  version = "0.16.0"

  enabled = module.this.enabled && var.access_logs_enabled && var.access_logs_s3_bucket_id == null

  attributes = compact(concat(module.this.attributes, ["access", "logs"]))

  force_destroy                 = var.nlb_access_logs_s3_bucket_force_destroy
  force_destroy_enabled         = var.nlb_access_logs_s3_bucket_force_destroy_enabled
  lifecycle_configuration_rules = var.lifecycle_configuration_rules

  # TODO: deprecate these inputs in favor of `lifecycle_configuration_rules`
  lifecycle_rule_enabled             = var.lifecycle_rule_enabled
  enable_glacier_transition          = var.enable_glacier_transition
  expiration_days                    = var.expiration_days
  glacier_transition_days            = var.glacier_transition_days
  noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
  noncurrent_version_transition_days = var.noncurrent_version_transition_days
  standard_transition_days           = var.standard_transition_days

  context = module.this.context
}

module "default_load_balancer_label" {
  source          = "cloudposse/label/null"
  version         = "0.25.0"
  id_length_limit = var.load_balancer_name_max_length
  context         = module.this.context
}

resource "aws_lb" "default" {
  #bridgecrew:skip=BC_AWS_LOGGING_22 - Skipping Ensure ELBv2 has Access Logging Enabled
  count              = module.this.enabled ? 1 : 0
  name               = var.load_balancer_name == "" ? module.default_load_balancer_label.id : substr(var.load_balancer_name, 0, var.load_balancer_name_max_length)
  tags               = module.this.tags
  internal           = var.internal
  load_balancer_type = "network"
  
 # dynamic "subnet_mapping" {
 #   for_each = var.subnet_mapping
 # 
 #   content {
 #     subnet_id      = each.value.subnet_ids
 #     allocation_id  = each.value.allocation_ids
 #   }
 # }

#  subnet_mapping {
#   subnet_id      = var.subnet_ids[0]
#   #allocation_id  = var.allocation_ids[0]
#} 
#  subnet_mapping {
#   subnet_id      = var.subnet_ids[1]
#   #allocation_id  = var.allocation_ids[1]
#}
#    subnet_mapping {
#   subnet_id      = var.subnet_ids[2]
#   #allocation_id  = var.allocation_ids[2]
#}
  subnets                          = var.subnet_ids
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing_enabled
  idle_timeout                     = var.idle_timeout
  ip_address_type                  = var.ip_address_type
  enable_deletion_protection       = var.deletion_protection_enabled
  drop_invalid_header_fields       = var.drop_invalid_header_fields
  preserve_host_header             = var.preserve_host_header

  access_logs {
    bucket  = try(element(compact([var.access_logs_s3_bucket_id, module.access_logs.bucket_id]), 0), "")
    prefix  = var.access_logs_prefix
    enabled = var.access_logs_enabled
  }
}


module "default_target_group_label" {
  source          = "cloudposse/label/null"
  version         = "0.25.0"
  attributes      = concat(module.this.attributes, ["TCP"])
  id_length_limit = var.target_group_name_max_length
  context         = module.this.context
}

resource "aws_lb_target_group" "defaults_nlb" {
  count                = module.this.enabled && var.default_target_group_enabled && length(var.target_group_ports_nlb) > 0 ? length(var.target_group_ports_nlb) : 0
  # count                = module.this.enabled && var.default_target_group_enabled && var.target_group_ports_nlb > 0 ? 1 : 0
  name                 = replace(replace(var.target_group_name, "/[^a-zA-Z0-9-]/", "-"), "/-+/", "-") != "" ? "${var.target_group_name}-${count.index + 1}" : "${module.default_target_group_label.id}-${count.index + 1}"
  port                 = var.target_group_ports_nlb      #[count.index]
  protocol             = var.target_group_protocol_tcp
  protocol_version     = var.target_group_protocol_version
  vpc_id               = var.vpc_id
  target_type          = var.target_group_target_type
  deregistration_delay = var.deregistration_delay
  slow_start           = var.slow_start

  health_check {
    enabled             = var.health_check_enabled
    protocol            = var.health_check_protocol != null ? var.health_check_protocol : var.target_group_protocol_tcp
    port                = var.health_check_ports_nlb    #[count.index]
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    interval            = var.health_check_interval
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    module.default_target_group_label.tags,
    var.target_group_additional_tags
  )
}

resource "aws_lb_target_group" "defaults_alb" {
  count                = module.this.enabled && var.default_target_group_enabled && length(var.target_group_ports_alb) > 0 ? length(var.target_group_ports_alb) : 0
  name                 = replace(replace(var.target_group_name, "/[^a-zA-Z0-9-]/", "-"), "/-+/", "-") != "" ? "${var.target_group_name}-BO${count.index + 1}" : "${module.default_target_group_label.id}-BO${count.index + 1}"
  port                 = var.target_group_ports_alb[count.index]
  protocol             = var.target_group_protocol_tcp
  protocol_version     = var.target_group_protocol_version
  vpc_id               = var.vpc_id
  target_type          = var.target_group_target_type_alb
  deregistration_delay = var.deregistration_delay
  slow_start           = var.slow_start

  health_check {
    enabled             = var.health_check_enabled
    protocol            = var.health_check_protocol != null ? var.health_check_protocol : var.target_group_protocol_https
    port                = var.health_check_ports_alb[count.index]
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    interval            = var.health_check_interval
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    module.default_target_group_label.tags,
    var.target_group_additional_tags
  )
}

resource "aws_lb_listener" "tcp_forward_tcp" {
  #bridgecrew:skip=BC_AWS_GENERAL_43 - Skipping Ensure that load balancer is using TLS 1.2.
  count             = module.this.enabled && var.tcp_enabled && length(var.tcp_ports_nlb) > 0 ? 2 : 0
  # count             = module.this.enabled && var.tcp_enabled && var.tcp_ports_nlb > 0 ? 1 : 0
  load_balancer_arn = join("", aws_lb.default.*.arn)
  
  port            = var.tcp_ports_nlb[count.index]
  protocol        = var.target_group_protocol_tcp
  tags            = merge(module.this.tags, var.listener_additional_tags)
  
  default_action {
     target_group_arn = join("", aws_lb_target_group.defaults_nlb.*.arn)
    type             = "forward"
  }
}

resource "aws_lb_listener" "tcp_forward_https" {
  #bridgecrew:skip=BC_AWS_GENERAL_43 - Skipping Ensure that load balancer is using TLS 1.2.
  count             = module.this.enabled && var.tcp_enabled && length(var.tcp_ports_alb) > 0 ? length(var.tcp_ports_alb) : 0
  load_balancer_arn = join("", aws_lb.default.*.arn)
  
  port            = var.tcp_ports_alb[count.index]
  protocol        = var.target_group_protocol_tcp
  tags            = merge(module.this.tags, var.listener_additional_tags)
  
  default_action {
    target_group_arn = join("", aws_lb_target_group.defaults_alb[count.index].*.arn)
    type             = "forward"
  }
}

#resource "aws_lb_listener" "tls" {
#  #bridgecrew:skip=BC_AWS_GENERAL_43 - Skipping Ensure that load balancer is using TLS 1.2.
#  count             = module.this.enabled && var.tls_enabled && length(var.tcp_ports_nlb) > 0 ? length(var.tcp_ports_nlb) : 0
#  load_balancer_arn = join("", aws_lb.default.*.arn)
#  
#  port            = var.tcp_ports_nlb[2]
#  protocol        = var.target_group_protocol_tls
#  ssl_policy      = var.tls_ssl_policy
#  certificate_arn = var.certificate_arn
#  tags            = merge(module.this.tags, var.listener_additional_tags)
#  
#  default_action {
#    target_group_arn = join("", aws_lb_target_group.defaults_nlb[1].*.arn)
#    type             = "forward"
#  }
#}
#
#resource "aws_lb_listener" "tcp_forward_dev" {
#  #bridgecrew:skip=BC_AWS_GENERAL_43 - Skipping Ensure that load balancer is using TLS 1.2.
#  count             = module.this.enabled && var.tcp_enabled ? length(var.tcp_ports_dev) : 0
#  load_balancer_arn = join("", aws_lb.default.*.arn)
#  
#  port            = var.tcp_ports_dev[count.index]
#  protocol        = var.target_group_protocol_tcp
#  tags            = merge(module.this.tags, var.listener_additional_tags)
#  
#  default_action {
#     target_group_arn = join("", aws_lb_target_group.defaults_nlb[0].*.arn)
#    type             = "forward"
#  }
#}