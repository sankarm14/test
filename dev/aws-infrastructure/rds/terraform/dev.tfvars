
# ---------------------------------------------------------------------------------------------------------------------
#   Env. info
# ---------------------------------------------------------------------------------------------------------------------
region                                          = "us-east-1"
namespace                                       = "valor"
stage                                           = "dev"
name                                            = "rds"
security_group_name                             = "valor-dev-rds-sg"

# ---------------------------------------------------------------------------------------------------------------------
#   RDS
# ---------------------------------------------------------------------------------------------------------------------

deletion_protection                             = true
database_name                                   = "valor_dev"
database_user                                   = "admin"
database_password                               = "mJ5vL9eB8uN1rQ9o"
database_port                                   = 3306
multi_az                                        = false
storage_type                                    = "io1"
storage_encrypted                               = true
allocated_storage                               = 500
iops                                            = 3000
max_allocated_storage                           = 1000
engine                                          = "mariadb"
engine_version                                  = "10.4.26"
major_engine_version                            = "10"
instance_class                                  = "db.m6i.2xlarge"
db_parameter_group                              = "mariadb10.4"
publicly_accessible                             = false
apply_immediately                               = true
performance_insights_enabled                    = true
copy_tags_to_snapshot                           = true
backup_retention_period                         = 30