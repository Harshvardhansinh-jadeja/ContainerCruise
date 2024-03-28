//for sending email
module "send_mail_redirect" {
  source= "./modules/SNS"
  email = "harshvardhansinhjadeja49@gmail.com"
  name = "Send_email_Redirect"
}