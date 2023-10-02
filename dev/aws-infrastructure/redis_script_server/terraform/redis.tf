module "redis" {
  source = "../../../../_modules/redis"

  zone_id                          = [data.terraform_remote_state.dev.outputs.zone_id]
  vpc_id                           = data.terraform_remote_state.dev.outputs.vpc_id
  allowed_security_groups          = [data.terraform_remote_state.scriptserver.outputs.script_server_sg_id]
  subnets                          = data.terraform_remote_state.dev.outputs.private_subnets
  cluster_mode_enabled             = var.cluster_mode_enabled
  cluster_size                     = var.cluster_size
  instance_type                    = var.instance_type
  apply_immediately                = true
  automatic_failover_enabled       = true
  engine_version                   = var.engine_version
  family                           = var.family
  at_rest_encryption_enabled       = var.at_rest_encryption_enabled
  transit_encryption_enabled       = var.transit_encryption_enabled
  cloudwatch_metric_alarms_enabled = var.cloudwatch_metric_alarms_enabled

  # Verify that we can safely change security groups (name changes forces new SG)
  security_group_create_before_destroy = true
  security_group_name                  = length(var.sg_name) > 0 ? [var.sg_name] : []

  parameter = [
    {
      name  = "notify-keyspace-events"
      value = "lK"
    }
  ]

  security_group_delete_timeout = "5m"

  log_delivery_configuration = [
    {
      destination      = module.cloudwatch_logs.log_group_name
      destination_type = "cloudwatch-logs"
      log_format       = "json"
      log_type         = "engine-log"
    },
    {
      destination      = module.cloudwatch_logs.log_group_name
      destination_type = "cloudwatch-logs"
      log_format       = "json"
      log_type         = "slow-log"
    }
  ]

  tags = {
    backup-1d7r              = "enabled"
  }

  context = module.this.context
}