output "vm_ip" {
  description = "The IP address of the VM"
  value       = aws_instance.vm.public_ip
}
