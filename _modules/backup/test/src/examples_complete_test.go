package test

import (
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	randId := strconv.Itoa(rand.Intn(100000))
	attributes := []string{randId}

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
		Vars: map[string]interface{}{
			"attributes": attributes,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	vpcCidr := terraform.Output(t, terraformOptions, "vpc_cidr")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "172.16.0.0/16", vpcCidr)

	// Run `terraform output` to get the value of an output variable
	privateSubnetCidrs := terraform.OutputList(t, terraformOptions, "private_subnet_cidrs")
	expectedPrivateSubnetCidrs := []string{"172.16.0.0/19", "172.16.32.0/19"}
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedPrivateSubnetCidrs, privateSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	publicSubnetCidrs := terraform.OutputList(t, terraformOptions, "public_subnet_cidrs")
	expectedPublicSubnetCidrs := []string{"172.16.96.0/19", "172.16.128.0/19"}
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedPublicSubnetCidrs, publicSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	efsArn := terraform.Output(t, terraformOptions, "efs_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, efsArn, "arn:aws:elasticfilesystem:us-east-2:")

	// Run `terraform output` to get the value of an output variable
	backupPlanArn := terraform.Output(t, terraformOptions, "backup_plan_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, backupPlanArn, "arn:aws:backup:us-east-2:")

	// Run `terraform output` to get the value of an output variable
	backupVaultArn := terraform.Output(t, terraformOptions, "backup_vault_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, backupVaultArn, "backup-vault:eg-test-backup-"+randId)

	// Run `terraform output` to get the value of an output variable
	backupVaultId := terraform.Output(t, terraformOptions, "backup_vault_id")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-backup-"+randId, backupVaultId)
}
