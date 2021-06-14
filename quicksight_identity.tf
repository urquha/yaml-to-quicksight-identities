resource "aws_quicksight_group" "quicksight_groups" {
  for_each = toset(yamldecode(file("quicksight_groups.yml"))["quicksight"])
  group_name = each.value
}

resource "aws_quicksight_user" "quicksight_users" {
  for_each      = { for item in yamldecode(file("quicksight_users.yml"))["user"] : item.email => item }
  user_name     = each.value.email
  email         = each.value.email
  identity_type = "IAM"
  user_role     = "AUTHOR"
  session_name  = each.value.email
}