class DeliveryMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_delivery delivery, user
    @delivery, @user = delivery, user
    if @delivery.attachment.present?
      attachments.inline['attach'] = File.read(delivery.attachment.path)
    end
    mail to: @user.email, subject: @delivery.subject
  end
end
