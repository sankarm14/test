
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
namespace                                       = "valor"
stage                                           = "staging"
name                                            = "redis"

# ---------------------------------------------------------------------------------------------------------------------
#   Redis
# ---------------------------------------------------------------------------------------------------------------------
instance_type                                   = "cache.t4g.small"
cluster_mode_enabled                            = false
cluster_size                                    = 3
family                                          = "redis7"
engine_version                                  = "7.0"
at_rest_encryption_enabled                      = false
transit_encryption_enabled                      = true
cloudwatch_metric_alarms_enabled                = true
sg_name                                         = "valor-redis-sg"