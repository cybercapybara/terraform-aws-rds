# terraform-aws-rds

Terraform module that manages an [Amazon RDS](https://aws.amazon.com/rds/)
database instance. It creates a single DB instance with encrypted storage by
default and exposes the connection endpoint so applications can wire up to it.

## Usage

```hcl
module "rds" {
  source = "github.com/moveeeax/terraform-aws-rds"

  identifier = "prod-postgres"
  engine     = "postgres"

  db_name  = "appdb"
  username = "appadmin"
  password = var.db_password

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name                     | Description                                             | Type           | Default          | Required |
|--------------------------|---------------------------------------------------------|----------------|------------------|:--------:|
| `identifier`             | Unique identifier for the DB instance.                  | `string`       | n/a              |   yes    |
| `engine`                 | Database engine to use.                                 | `string`       | `"postgres"`     |    no    |
| `engine_version`         | Engine version to run.                                  | `string`       | `null`           |    no    |
| `instance_class`         | Instance class for the DB instance.                     | `string`       | `"db.t3.micro"`  |    no    |
| `allocated_storage`      | Allocated storage in gibibytes.                         | `number`       | `20`             |    no    |
| `db_name`                | Name of the initial database to create.                 | `string`       | `null`           |    no    |
| `username`               | Master username for the DB instance.                    | `string`       | n/a              |   yes    |
| `password`               | Master password for the DB instance.                    | `string`       | n/a              |   yes    |
| `multi_az`               | Deploy the instance across multiple AZs.                | `bool`         | `false`          |    no    |
| `storage_encrypted`      | Encrypt the underlying storage.                         | `bool`         | `true`           |    no    |
| `vpc_security_group_ids` | VPC security group IDs to associate.                    | `list(string)` | `[]`             |    no    |
| `db_subnet_group_name`   | Name of the DB subnet group to launch in.               | `string`       | `null`           |    no    |
| `skip_final_snapshot`    | Skip the final snapshot on destroy.                     | `bool`         | `true`           |    no    |
| `tags`                   | Tags applied to the DB instance.                        | `map(string)`  | `{}`             |    no    |

## Outputs

| Name       | Description                                            |
|------------|--------------------------------------------------------|
| `id`       | Identifier of the DB instance.                         |
| `arn`      | ARN of the DB instance.                                |
| `endpoint` | Connection endpoint in address:port form.              |
| `address`  | Hostname of the DB instance.                           |
| `port`     | Port the DB instance listens on.                       |

## License

[MIT](LICENSE)
