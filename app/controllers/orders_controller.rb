class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @product = ProductListing.find(params[:item_id])
    @order_form = OrderForm.new
    if current_user.id == @product.user_id || ProductPurchaseUser.exists?(product_listing_id: params[:item_id])
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    if @order_form.valid?
      pay_card
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    @product = ProductListing.find(params[:item_id])
    params.require(:order_form).permit(:post, :area_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, product_listing_id: @product.id, token: params[:token], price: @product.fee
    )
  end

  def pay_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
