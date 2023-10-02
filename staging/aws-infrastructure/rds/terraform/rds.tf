module "rds" {
  source = "../../../../_modules/rds"

  database_name                             = var.database_name
  database_user                             = var.database_user
  database_password                         = var.database_password
  database_port                             = var.database_port
  multi_az                                  = var.multi_az
  storage_type                              = var.storage_type
  allocated_storage                         = var.allocated_storage
  storage_encrypted                         = var.storage_encrypted
  iops                                      = var.iops
  engine                                    = var.engine
  engine_version                            = var.engine_version
  instance_class                            = var.instance_class
  db_parameter_group                        = var.db_parameter_group
  publicly_accessible                       = var.publicly_accessible
  vpc_id                                    = data.terraform_remote_state.staging.outputs.vpc_id
  subnet_ids                                = data.terraform_remote_state.staging.outputs.database_subnets
  security_group_ids                        = [module.sg.id]
  apply_immediately                         = var.apply_immediately
  availability_zone                         = var.availability_zone
  db_subnet_group_name                      = var.db_subnet_group_name
  max_allocated_storage                     = var.max_allocated_storage
  performance_insights_enabled              = var.performance_insights_enabled
  copy_tags_to_snapshot                     = var.copy_tags_to_snapshot
  backup_retention_period                   = var.backup_retention_period

  db_parameter = [
    {
      name         = "myisam_sort_buffer_size"
      value        = "1048576"
      apply_method = "immediate"
    },
    {
      name         = "sort_buffer_size"
      value        = "2097152"
      apply_method = "immediate"
    }
  ]

  context = module.this.context
}