class PurchaseConfirmation < ActionMailer::Base
  default from: "bobongithub@gmail.com"

  def invoice(current_user)
    @greeting = "Hi"
    @user = current_user
    mail to: current_user.email
  end
end
