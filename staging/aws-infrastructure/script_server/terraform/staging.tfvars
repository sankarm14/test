
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "staging"
vpc_name                                        = "valor-staging-vpc"
subnet_name                                     = "staging-private-subnet-a"
security_group_name                             = "valor-staging-scriptserver-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Encryption Key
# ---------------------------------------------------------------------------------------------------------------------
key_namespace                                   = "scriptserver"
key_stage                                       = "staging"
key_name                                        = "staging-kms-scriptserver"
key_description                                 = "KMS CMK to encrypt EBS, EFS, and any other storage"
key_deletion_window_in_days                     = "10"
key_enable_key_rotation                         = "true"
key_alias                                       = "alias/staging-kms-scriptserver"
key_key_usage                                   = "ENCRYPT_DECRYPT"


# ---------------------------------------------------------------------------------------------------------------------
#   scriptserver
# ---------------------------------------------------------------------------------------------------------------------
scriptserver_count                              = "1"
scriptserver_name                               = "scriptserver"
scriptserver_instance_type                      = "t3.large"
scriptserver_key_pair                           = "staging-environment-instances-us-east-1"
scriptserver_root_volume_size                   = "200"
scriptserver_private_ips                        = {
                                                0   =   "10.20.1.10"
                                                }
# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"