class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.scoped
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(params[:delivery])
    p params
    if @delivery.save
      if params[:case] == '0'
        DeliveryWorker.perform_async(@delivery.id)
      else
        DeliveryWorker.perform_async(@delivery.id, false)
      end
      redirect_to deliveries_path, notice: 'Delivery started'
    else
      flash.now[:alert] = "Delivery not saved. Errors: #{@delivery.errors.to_a.join('; ')}"
      render :new
    end
  end
end