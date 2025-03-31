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
