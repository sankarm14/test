
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region              = "us-east-1"
security_group_name = "valor-staging-bo1-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Autoscale Group
# ---------------------------------------------------------------------------------------------------------------------
namespace                              = "valor"
stage                                  = "staging"
name                                   = "bo1"
instance_type                          = "t3.large"
health_check_type                      = "EC2"
wait_for_capacity_timeout              = "5m"
max_size                               = 5
min_size                               = 2
cpu_utilization_high_threshold_percent = 80
cpu_utilization_low_threshold_percent  = 20
ec2_autoscale_key_name                 = "staging-environment-instances-us-east-1"

# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name = "ValorInstanceProfileSSM"
