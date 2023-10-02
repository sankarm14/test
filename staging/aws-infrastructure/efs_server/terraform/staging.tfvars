
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "staging"
vpc_name                                        = "valor-staging-vpc"
subnet_name                                     = "staging-private-subnet-a"
security_group_name                             = "valor-staging-efsserver-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Encryption Key
# ---------------------------------------------------------------------------------------------------------------------
key_namespace                                   = "efsserver"
key_stage                                       = "staging"
key_name                                        = "staging-kms-efsserver"
key_description                                 = "KMS CMK to encrypt EBS, EFS, and any other storage"
key_deletion_window_in_days                     = "10"
key_enable_key_rotation                         = "true"
key_alias                                       = "alias/staging-kms-efsserver"
key_key_usage                                   = "ENCRYPT_DECRYPT"


# ---------------------------------------------------------------------------------------------------------------------
#   scriptserver
# ---------------------------------------------------------------------------------------------------------------------
efsserver_count                              = "1"
efsserver_name                               = "efs-server"
efsserver_instance_type                      = "t3.large"
efsserver_key_pair                           = "staging-environment-instances-us-east-1"
efsserver_root_volume_size                   = "200"
efsserver_private_ips                        = {
                                                0   =   "10.20.1.12"
                                                }
# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"