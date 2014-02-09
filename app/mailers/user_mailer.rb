class UserMailer < ActionMailer::Base
  default from: "from@example.com"

 def contact_email(message)
    @user = message.user
    @text = message.text

    mail to: @product_owner.email,
    from: @user.email,
    subject: message.subject,
    text: message.text

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
 end

end
