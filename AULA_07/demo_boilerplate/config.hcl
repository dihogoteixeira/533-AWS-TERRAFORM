
# provider "aws" {
#   alias = "cliente-0"
#   region = "sa-east-1"
#   profile = "cliente-0-profile"
#   assume_role {
#     role_arn = "arn:aws:iam:3425342246:role/CrossAccountManager-terraform"

#   }
# }

# provider "aws" {
#   alias = "cliente-1"
#   region = "us-east-1"
#   profile = "cliente-1-profile"
#   assume_role {
#     role_arn = "arn:aws:iam:3425342246:role/CrossAccountManager-terraform"

#   }
# }

# provider "aws" {
#   alias = "cliente-2"
#   region = "us-east-2"
#   profile = "cliente-2-profile"
#   assume_role {
#     role_arn = "arn:aws:iam:3425342246:role/CrossAccountManager-terraform"

#   }
# }

# resource "null_resource" "bash" {

#   provisionet local-exec {
#     command = "sleep 99d"
#   }

#   connection {
#     type     = "ssh"
#     user     = "root"
#     password = var.root_password
#     host     = aws_instance.web.private_ip
#   }

#   provisioner remote-exec {
#     inline = [
#       "puppet apply",
#       "consul join ${aws_instance.web.private_ip}",
#     ]
#   }
# }
