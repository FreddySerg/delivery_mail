class DeliveryWorker
  include Sidekiq::Worker

  def perform(delivery_id, one_only = true)
    delivery = Delivery.find(delivery_id)
    if one_only
      DeliveryMailer.send_delivery(delivery, User.first).deliver
    else
      User.find_each do |u|
        DeliveryMailer.send_delivery(delivery, u).deliver
      end
    end
    delivery.update_attributes(status: Delivery::COMPLETED)
  end
end
