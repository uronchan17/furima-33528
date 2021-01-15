class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end
  
  def new
    @product_listing = ProductListing.new
  end

  def create
    @product_listing = ProductListing.new(items_params)
    if @product_listing.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:product_listing).permit(:product_name, :explain, :category_id, :state_id, :delivery_fee_id, :area_id, :days_to_ship_id, :fee, :image).merge(user_id: current_user.id)
  end
end
