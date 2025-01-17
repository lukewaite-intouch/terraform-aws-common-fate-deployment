variable "namespace" {
  description = "Specifies the namespace for the deployment."
  default     = "common-fate"
  type        = string
}

variable "stage" {
  description = "Defines the stage of the deployment (e.g., 'dev', 'staging', 'prod')."
  default     = "prod"
  type        = string
}

variable "vpc_id" {
  description = "Specifies the ID of the Virtual Private Cloud (VPC)."
  type        = string
}

variable "subnet_ids" {
  description = "Lists the IDs of the subnets."
  type        = list(string)
}

variable "database_security_group_id" {
  description = "Specifies the ID of the security group for the database."
  type        = string
}

variable "database_secret_sm_arn" {
  description = "The AWS Secrets Manager ARN for the database credentials."
  type        = string
}

variable "database_user" {
  description = "Specifies the username for database access."
  type        = string
}

variable "database_host" {
  description = "Specifies the hostname or IP address of the database."
  type        = string
}

variable "sqs_queue_arn" {
  description = "Specifies the Amazon Simple Queue Service (SQS) queue ARN."
  type        = string
}

variable "sqs_queue_name" {
  description = "Specifies the name of the Amazon SQS queue."
  type        = string
}

variable "eventbus_arn" {
  description = "Specifies the Amazon EventBridge (formerly CloudWatch Events) EventBus ARN."
  type        = string
}

variable "release_tag" {
  description = "Defines the tag for frontend and backend images, typically a git commit hash."
  type        = string
}


variable "app_url" {
  description = "The app url (e.g., 'https://common-fate.mydomain.com')."
  type        = string

  validation {
    condition     = can(regex("^https://", var.app_url))
    error_message = "The app_url must start with 'https://'."
  }
}


variable "scim_token_ps_arn" {
  description = "The AWS Parameter Store ARN for the SCIM token."
  default     = ""
  type        = string
}

variable "aws_region" {
  description = "Determines the AWS Region for deployment."
  type        = string
}

variable "ecs_cluster_id" {
  description = "Identifies the Amazon Elastic Container Service (ECS) cluster for deployment."
  type        = string
}

variable "auth_issuer" {
  description = "Specifies the issuer for authentication."
  type        = string
}

variable "control_plane_service_client_id" {
  description = "Specifies the client ID for the control_plane service."
  type        = string
}

variable "control_plane_service_client_secret" {
  description = "Specifies the client secret for the control_plane service."
  type        = string
  sensitive   = true
}
variable "oidc_control_plane_issuer" {
  description = "OIDC issuer for the Control Plane service"
  type        = string
}
variable "slack_service_client_id" {
  description = "Specifies the client ID for the slack service."
  type        = string
}

variable "slack_service_client_secret" {
  description = "Specifies the client secret for the slack service."
  type        = string
  sensitive   = true
}
variable "oidc_slack_issuer" {
  description = "OIDC issuer for the Slack service"
  type        = string
}

variable "alb_listener_arn" {
  description = "Specifies the Amazon Load Balancer (ALB) listener ARN."
  type        = string
}

variable "licence_key" {
  description = "The Common Fate licence key."
  type        = string
}

variable "log_retention_in_days" {
  description = "Specifies the cloudwatch log retention period."
  default     = 365
  type        = number
}
variable "ecs_task_cpu" {
  description = "The amount of CPU to allocate for the ECS task. Specified in CPU units (1024 units = 1 vCPU)."
  type        = string
  default     = "512" # Example default, adjust as needed
}

variable "ecs_task_memory" {
  description = "The amount of memory to allocate for the ECS task. Specified in MiB."
  type        = string
  default     = "1024" # Example default, adjust as needed
}
variable "desired_task_count" {
  description = "The desired number of instances of the task to run."
  type        = number
  default     = 1
}

variable "worker_ecs_task_cpu" {
  description = "The amount of CPU to allocate for the ECS worker task. Specified in CPU units (1024 units = 1 vCPU)."
  type        = string
  default     = "512" # Example default, adjust as needed
}

variable "worker_ecs_task_memory" {
  description = "The amount of memory to allocate for the ECS task. Specified in MiB."
  type        = string
  default     = "1024" # Example default, adjust as needed
}
variable "desired_worker_task_count" {
  description = "The desired number of instances of the worker task to run."
  type        = number
  default     = 1
}

variable "scim_source" {
  description = "The name of the SCIM identity provider (e.g., 'Entra')"
  default     = ""
  type        = string
}
variable "aws_partition" {
  description = "The AWS partition the module is being deployed to"
}

variable "aws_account_id" {
  description = "The AWS account ID the module is being deployed to"
}


variable "log_level" {
  description = "Log level for ECS service"
  type        = string
  default     = "INFO"
}

variable "otel_log_group_name" {
  description = "Log group for OTel collector"
  type        = string
}

variable "otel_writer_iam_policy_arn" {
  description = "IAM policy for OpenTelemetry"
  type        = string
}


variable "alb_security_group_id" {
  type        = string
  description = "the security group id for the outward facing alb"
}



variable "additional_cors_allowed_origins" {
  type        = list(string)
  default     = []
  description = "Additional origins to add to the CORS allowlist. By default, the app URL is automatically added."
}

variable "report_bucket_arn" {
  type        = string
  description = "ARN of report bucket"
}

variable "report_bucket_name" {
  type        = string
  description = "Name of report bucket"
}


variable "assume_role_external_id" {
  description = "(Optional) External ID to use when assuming cross-account AWS roles for auditing and provisioning."
  type        = string
  default     = ""
}

variable "grant_assume_on_role_arns" {
  description = "(Deprecated) The ARNs of the IAM roles which the controlplane should be able to assume."
  type        = list(string)
  default     = []
}

variable "authz_eval_bucket_name" {
  type        = string
  description = "Name of authorization evaluation bucket"
}

variable "authz_eval_bucket_arn" {
  type        = string
  description = "ARN of authorization evaluation bucket"
}

variable "worker_image_repository" {
  type        = string
  description = "Docker image repository to use for the Worker image"
  default     = "public.ecr.aws/z2x0a3a1/common-fate-deployment/worker"
}

variable "control_image_repository" {
  type        = string
  description = "Docker image repository to use for the Control image"
  default     = "public.ecr.aws/z2x0a3a1/common-fate-deployment/control"
}


variable "service_discovery_namespace_arn" {
  type        = string
  description = "namespace arn of service discovery namespace"
}

variable "access_handler_security_group_id" {
  type        = string
  description = "The id of the security group for the access handler"
}

variable "access_handler_service_connect_address" {
  type        = string
  description = "the internal address assigned to the access handler service by AWS ECS service connect"
}

variable "xray_monitoring_enabled" {
  description = "If enabled, writes OpenTelemetry monitoring events to AWS X-Ray."
  type        = bool
  default     = true
}

variable "managed_monitoring_enabled" {
  description = "Enables Managed Monitoring for the deployment."
  type        = bool
  default     = false
}

variable "managed_monitoring_endpoint" {
  description = "The Managed Monitoring OpenTelemetry endpoint"
  type        = string
  default     = "otel.commonfate.io"
}

variable "factory_base_url" {
  description = "The Common Fate Factory API Base URL"
  type        = string
  default     = "https://factory.commonfate.io"
}

variable "factory_oidc_issuer" {
  description = "The Common Fate Factory OIDC Issuer"
  type        = string
  default     = "https://factory.commonfate.io"
}

variable "database_auto_migrate" {
  type        = bool
  default     = true
  description = "Whether to run database migrations automatically when the Control Plane service starts. If rolling back to a previous release after a migration has run, set this to `false`."
}


variable "oidc_terraform_client_id" {
  description = "Terraform Service Account OIDC Client ID"
  type        = string
}
variable "oidc_read_only_client_id" {
  description = "Read Only OIDC Client ID"
  type        = string
}

variable "oidc_access_handler_service_client_id" {
  description = "Access Handler Service Account OIDC Client ID"
  type        = string
}

variable "oidc_provisioner_service_client_id" {
  description = "Provisioner Service Account OIDC Client ID"
  type        = string
}

variable "usage_reporting_enabled" {
  description = "Enables usage reporting for the deployment."
  type        = bool
  default     = true
}

variable "usage_reporting_interval" {
  description = "The interval to report deployment usage on (e.g. '1h')."
  type        = string
  default     = "1h"
}

variable "sync_entra_identities_enabled" {
  description = "Enables the Entra Identities Sync background task"
  type        = bool
  default     = true
}

variable "sync_okta_enabled" {
  description = "Enables the Okta Sync background task"
  type        = bool
  default     = true
}

variable "saml_entity_id" {
  description = "The Cognito entity ID required for SAML configuration."
  type        = string
}


variable "saml_acs_url" {
  description = "The Cognito Assertion Consumer Service (ACS) URL required for SAML configuration."
  type        = string
}

variable "terraform_service_client_secret" {
  description = "Specifies the client secret for the terraform service."
  type        = string
  sensitive   = true
}
variable "provisioner_service_client_secret" {
  description = "Specifies the client secret for the provisioner service."
  type        = string
  sensitive   = true
}
variable "read_only_service_client_secret" {
  description = "Specifies the client secret for the read_only service."
  type        = string
  sensitive   = true
}
variable "factory_monitoring" {
  description = "Enables ecs task reporting to Common Fate"
  type        = bool
  default     = true
}
variable "administrator_emails" {
  description = "List of user emails to assign the administrator role. Users will also be invited to the initial cognito user pool. The administrator role can also be assigned via the console. Note, users defined by this variable will always be assigned to the administrator role at startup of the control plane service."
  default     = []
  type        = list(string)
}

variable "control_plane_target_group_arns" {
  type        = list(string)
  description = "Additional target groups to attach the service to."
  default     = []
}
