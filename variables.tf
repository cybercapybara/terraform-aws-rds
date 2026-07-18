variable "identifier" {
  description = "Unique identifier for the DB instance."
  type        = string
}

variable "engine" {
  description = "Database engine to use, for example postgres or mysql."
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Engine version to run. Null lets AWS pick the default for the engine."
  type        = string
  default     = null
}

variable "instance_class" {
  description = "Instance class for the DB instance."
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in gibibytes."
  type        = number
  default     = 20

  validation {
    condition     = var.allocated_storage >= 20
    error_message = "allocated_storage must be at least 20 GiB."
  }
}

variable "db_name" {
  description = "Name of the initial database to create. Null skips creation."
  type        = string
  default     = null
}

variable "username" {
  description = "Master username for the DB instance."
  type        = string
}

variable "password" {
  description = "Master password for the DB instance."
  type        = string
  sensitive   = true
}

variable "multi_az" {
  description = "Whether to deploy the instance across multiple availability zones."
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Whether to encrypt the underlying storage."
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the instance."
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group to launch the instance in. Null uses the default."
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Whether to skip taking a final snapshot when the instance is destroyed."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the DB instance."
  type        = map(string)
  default     = {}
}
