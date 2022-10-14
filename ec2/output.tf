
# data "aws_vpc" "vpc" {
#   filter {
#     name = "tag:Name"
#     values = ["customvpc"]
#   }
# }

# data "aws_subnet" "subnet" {
#   filter {
#     name = "tag:Name"
#     values = ["customvpc"]
#   }
# }

# output "aws_vpc" {
#     value = data.aws_vpc.vpc.id
# }
# output "aws_subnets" {
#   value = data.aws_subnet.subnet.id
# }