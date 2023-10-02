module "backup" {
  source = "../../../../_modules/backup"
  
  name                          = "aws-ue1-staging-backup-plan-1d7r"
  schedule                      = "cron(0 5 ? * * *)"
  selection_tags                = [
    {
      type  = "STRINGEQUALS"
      key   = "backup-1d7r"
      value = "enabled" 
    }
  ]
  vault_name                    = "aws-ue1-staging-backup-vault"
  delete_after                  = "7"
  start_window                  = "480"
  completion_window             = "10080"
}