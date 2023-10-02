module "backup" {
  source = "../../../../_modules/backup"
  
  name                          = "aws-ue1-prod-backup-plan-1d30r"
  schedule                      = "cron(0 5 ? * * *)"
  selection_tags                = [
    {
      type  = "STRINGEQUALS"
      key   = "backup-1d30r"
      value = "enabled" 
    }
  ]
  vault_name                    = "aws-ue1-prod-backup-vault"
  delete_after                  = "30"
  start_window                  = "480"
  completion_window             = "10080"
}