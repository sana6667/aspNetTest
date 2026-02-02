resource "aws_key_pair" "my_ssh_key" {
    key_name = "bastion-ssh-key"
    public_key = file(var.conf_bastion_host["path_ssh_key"])
    tags = {
        name = "baction-admin-key-ssh"
    }
}