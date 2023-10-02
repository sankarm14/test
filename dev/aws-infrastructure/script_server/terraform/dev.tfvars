
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "dev"
vpc_name                                        = "valor-dev-vpc"
subnet_name                                     = "dev-private-subnet-a"
security_group_name                             = "valor-dev-scriptserver-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Encryption Key
# ---------------------------------------------------------------------------------------------------------------------
key_namespace                                   = "scriptserver"
key_stage                                       = "dev"
key_name                                        = "dev-kms-scriptserver"
key_description                                 = "KMS CMK to encrypt EBS, EFS, and any other storage"
key_deletion_window_in_days                     = "10"
key_enable_key_rotation                         = "true"
key_alias                                       = "alias/dev-kms-scriptserver"
key_key_usage                                   = "ENCRYPT_DECRYPT"


# ---------------------------------------------------------------------------------------------------------------------
#   scriptserver
# ---------------------------------------------------------------------------------------------------------------------
scriptserver_count                              = "1"
scriptserver_name                               = "scriptserver"
scriptserver_instance_type                      = "t3.large"
scriptserver_key_pair                           = "dev-environment-instances-us-east-1"
scriptserver_root_volume_size                   = "200"
scriptserver_private_ips                        = {
                                                0   =   "10.10.1.10"
                                                }
# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"