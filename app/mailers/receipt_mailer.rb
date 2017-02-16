class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order, items) 

    @order = order
    @items = items
    subject = "Thank you for shopping on Jungle! - Order #{@order.id}"

    mail(to: @order.email, subject: subject)

  end
  
end
