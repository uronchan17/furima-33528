class OrdersController < ApplicationController
  def index
    @product = ProductListing.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    
    @order_form.save
    redirect_to root_path
  end

  private
  def purchase_params
    @product = ProductListing.find(params[:item_id])
    params.require(:order_form).permit(:post, :area_id, :municipality, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id, product_listing_id: @product.id, token: params[:token], price: @product.fee)
  end
end