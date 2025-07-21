rule "terraform_comment_syntax" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_comment_syntax.md
  enabled = true
}

rule "terraform_deprecated_index" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_deprecated_index.md
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_deprecated_interpolation.md
  enabled = true
}

rule "terraform_deprecated_lookup" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_deprecated_lookup.md
  enabled = true
}

rule "terraform_documented_outputs" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_documented_outputs.md
  enabled = true
}

rule "terraform_documented_variables" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_documented_variables.md
  enabled = true
}

rule "terraform_module_pinned_source" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_module_pinned_source.md
  enabled          = true

  style            = "semver"
  default_branches = ["master", "main"]
}

rule "terraform_module_version" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_module_version.md
  enabled = true
}

rule "terraform_naming_convention" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_naming_convention.md
  enabled = true

  format  = "snake_case"
}

rule "terraform_required_providers" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_required_providers.md
  enabled = true

  source = true
  version = true
}

rule "terraform_required_version" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_required_version.md
  enabled = true
}

rule "terraform_standard_module_structure" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_standard_module_structure.md
  # NOTE: This should only be enabled for Terraform modules
  enabled = true
}

rule "terraform_typed_variables" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_typed_variables.md
  enabled = true
}

rule "terraform_unused_declarations" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_unused_declarations.md
  enabled = true
}

rule "terraform_unused_required_providers" {
  # https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/terraform_unused_required_providers.md
  enabled = true
}
