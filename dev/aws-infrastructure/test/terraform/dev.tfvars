
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "dev"
vpc_name                                        = "valor-dev-vpc"
subnet_name                                     = "dev-private-subnet-a"
security_group_name                             = "valor-dev-Test-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Encryption Key
# ---------------------------------------------------------------------------------------------------------------------
key_namespace                                   = "MyTestInstance2"
key_stage                                       = "dev"
key_name                                        = "dev-kms-MyTestInstance2"
key_description                                 = "KMS CMK to encrypt EBS, EFS, and any other storage"
key_deletion_window_in_days                     = "10"
key_enable_key_rotation                         = "true"
key_alias                                       = "alias/dev-kms-MyTestInstance2"
key_key_usage                                   = "ENCRYPT_DECRYPT"


# ---------------------------------------------------------------------------------------------------------------------
#   mytestinstance
# ---------------------------------------------------------------------------------------------------------------------
mytestinstance_count                              = "1"
mytestinstance_name                               = "MyTestInstance2"
mytestinstance_instance_type                      = "t3.large"
mytestinstance_key_pair                           = "dev-environment-instances-us-east-1"
mytestinstance_root_volume_size                   = "200"
mytestinstance_private_ips                        = {
                                                0   =   "10.10.1.16"
                                                }
# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"