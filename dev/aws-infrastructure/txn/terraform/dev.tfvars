
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
security_group_name                             = "valor-dev-txn-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Autoscale Group
# ---------------------------------------------------------------------------------------------------------------------
namespace                                       = "valor"
stage                                           = "dev"
name                                            = "txn"
instance_type                                   = "t3.large"
health_check_type                               = "EC2"
wait_for_capacity_timeout                       = "5m"
max_size                                        = 5
min_size                                        = 2
cpu_utilization_high_threshold_percent          = 80
cpu_utilization_low_threshold_percent           = 20
ec2_autoscale_key_name                          = "dev-environment-instances-us-east-1"

# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"

