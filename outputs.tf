#in case of single instance and multi instance, via a 'count meta'
# output "ec2_public_ip" {
#     # value = aws_instance.my_instance.public_ip #single instance value output
#     value = aws_instance.my_instance[*].public_ip #multi instance value output
# }

# output "ec2_public_dns" {
#     # value = aws_instance.my_instance.public_dns #single instance value output
#     value = aws_instance.my_instance[*].public_dns #multi instance value output
# }

# output "ec2_pirvate_ip" {
#     # value = aws_instance.my_instance.private_ip #single instance value output
#     value = aws_instance.my_instance[*].private_ip #multi instance value output
# }


# in case of for_each loop for instance
output "ec2_public_ip" {
    value = { for instance in aws_instance.my_instance : instance.id => instance.public_ip }
}
output "ec2_public_dns" {
    value = { for instance in aws_instance.my_instance : instance.id => instance.public_dns }
}
output "ec2_private_ip" {
    value = { for instance in aws_instance.my_instance : instance.id => instance.private_ip }
}