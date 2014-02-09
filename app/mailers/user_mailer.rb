class UserMailer < ActionMailer::Base
  default from: "from@example.com"

 def contact_email(message)
    @user = message.user
    @text = message.text

    mail to: (email),
    from: @user.email,
    subject: message.subject,
    text: message.text

    mail(to: @user.email, subject: 'Interest Expressed on ')
 end

end
