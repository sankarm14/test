# ------------------------------------------------------------------------------
# OUTPUT CALCULATED VARIABLES (prefer full objects)
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ------------------------------------------------------------------------------

output "zone" {
  description = "The created Hosted Zone(s)."
  value       = try(aws_route53_zone.zone, {})
}

output "records" {
  description = "A list of all created records."
  value       = try(aws_route53_record.record, {})
}

output "delegation_set" {
  description = "The outputs of the created delegation set."
  value       = try(aws_route53_delegation_set.delegation_set[0], {})
}

#output "alias_name" {
#  value = aws_route53_record.record[*].alias[*].name
#}

#output "alias_name" {
#  value = [for alias in values(aws_route53_record.record)[*].alias[*] : alias.name]
#}

#output "alias_zone_id" {
#  value = aws_route53_record.record[*].alias[*].zone_id
#}

#output "alias_value" {
#  value = aws_route53_record.record[*].alias[*].evaluate_target_health
#}

# ------------------------------------------------------------------------------
# OUTPUT ALL INPUT VARIABLES
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# OUTPUT MODULE CONFIGURATION
# ------------------------------------------------------------------------------

output "module_enabled" {
  description = "Whether the module is enabled"
  value       = var.module_enabled
}
