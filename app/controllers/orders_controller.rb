class OrdersController < ApplicationController
  def index
    @product = ProductListing.find(params[:item_id])
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    @order_form.save
  end

  private
  def purchase_params
    params.require(:order_form).permit(:post, :area_id, :municipality, :address, :building, :phone_number)
  end
end