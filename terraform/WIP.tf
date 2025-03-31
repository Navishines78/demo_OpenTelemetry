# OpenTelemetry

provider "aws" {
        region = "ap-south-1"
}

resource "aws_iam_user" "admin1" {
        name = "Naveen"
}

resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
        user = aws_iam_user.admin1.name
        policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

####################################################################

resource "aws_key_pair" "ssh_key" {
	name = "key for ssh"
	public_key = file("~/.ssh/id_rsa.pub")
}
####################################################################
resource "aws_ec2_insatnce" "demo_server" {
	ami = "ami-sampleeeeeeeeeeeeeeeee"
	instance_type = "t4.medium"
	key_name = aws_key_pair.ssh_key.name
	associate_public_ip_address = true
}
