
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "shared"
vpc_name                                        = "valor-shared-vpc"
subnet_name                                     = "shared-private-subnet-a"
security_group_name                             = "valor-shared-gitlab-copy-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Encryption Key
# ---------------------------------------------------------------------------------------------------------------------
key_namespace                                   = "gitlab-copy"
key_stage                                       = "shared"
key_name                                        = "shared-kms-gitlab-copy"
key_description                                 = "KMS CMK to encrypt EBS, EFS, and any other storage"
key_deletion_window_in_days                     = "10"
key_enable_key_rotation                         = "true"
key_alias                                       = "alias/shared-kms-gitlab-copy"
key_key_usage                                   = "ENCRYPT_DECRYPT"


# ---------------------------------------------------------------------------------------------------------------------
#   gitlab
# ---------------------------------------------------------------------------------------------------------------------
gitlab_count                                      = "1"
gitlab_name                                       = "gitlab-copy"
gitlab_instance_type                              = "t3.large"
gitlab_key_pair                                   = "key-1"
gitlab_root_volume_size                           = "50"
gitlab_private_ips                               = {
                                                    0   =   "10.0.101.112"
                                                }
# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"