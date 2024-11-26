## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | /home/admin/ter-homeworks/04/local-vpc/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | n/a | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | n/a | `string` | n/a | yes |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | `"develop-network"` | no |
| <a name="input_network_zone"></a> [network\_zone](#input\_network\_zone) | n/a | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_develop_subnet_id"></a> [develop\_subnet\_id](#output\_develop\_subnet\_id) | n/a |
