
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "dev"
vpc_name                                        = "valor-dev-vpc"
subnet_name                                     = "dev-private-subnet-a"
security_group_name                             = "valor-dev-efsserver-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Encryption Key
# ---------------------------------------------------------------------------------------------------------------------
key_namespace                                   = "efsserver"
key_stage                                       = "dev"
key_name                                        = "dev-kms-efsserver"
key_description                                 = "KMS CMK to encrypt EBS, EFS, and any other storage"
key_deletion_window_in_days                     = "10"
key_enable_key_rotation                         = "true"
key_alias                                       = "alias/dev-kms-efsserver"
key_key_usage                                   = "ENCRYPT_DECRYPT"


# ---------------------------------------------------------------------------------------------------------------------
#   scriptserver
# ---------------------------------------------------------------------------------------------------------------------
efsserver_count                              = "1"
efsserver_name                               = "efs-server"
efsserver_instance_type                      = "t3.large"
efsserver_key_pair                           = "dev-environment-instances-us-east-1"
efsserver_root_volume_size                   = "200"
efsserver_private_ips                        = {
                                                0   =   "10.10.1.12"
                                                }
# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"