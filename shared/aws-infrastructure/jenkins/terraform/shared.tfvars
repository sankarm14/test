
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
env_name                                        = "shared"
vpc_name                                        = "valor-shared-vpc"
subnet_name                                     = "shared-private-subnet-a"
security_group_name                             = "valor-shared-jenkins-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   Encryption Key
# ---------------------------------------------------------------------------------------------------------------------
key_namespace                                   = "jenkins"
key_stage                                       = "shared"
key_name                                        = "shared-kms-jenkins"
key_description                                 = "KMS CMK to encrypt EBS, EFS, and any other storage"
key_deletion_window_in_days                     = "10"
key_enable_key_rotation                         = "true"
key_alias                                       = "alias/shared-kms-jenkins"
key_key_usage                                   = "ENCRYPT_DECRYPT"


# ---------------------------------------------------------------------------------------------------------------------
#   jenkins
# ---------------------------------------------------------------------------------------------------------------------
jenkins_count                                      = "1"
jenkins_name                                       = "jenkins"
jenkins_instance_type                              = "t3.large"
jenkins_key_pair                                   = "shared-environment-instances-us-east-1"
jenkins_root_volume_size                           = "50"
jenkins_private_ips                               = {
                                                    0   =   "10.0.1.100"
                                                }
# ---------------------------------------------------------------------------------------------------------------------
#   Instance Profile
# ---------------------------------------------------------------------------------------------------------------------
aws_iam_instance_profile_name                   = "ValorInstanceProfileSSM"