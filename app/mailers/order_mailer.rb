class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(user,order,order_items)
    @user = user
    @order_items = order_items
    @order = order
    mail(to: user.email , subject: "Amaze-ON : New Order").deliver

  end
end
