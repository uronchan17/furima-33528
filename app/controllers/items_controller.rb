class ItemsController < ApplicationController
  def index
  end
  
  def new
  end

  def create
    ProductListing.create(items_params)
  end

  private
  def items_params
    params.require(:product_listing).permit(:product_name, :explain, :category_id, :state_id, :delivery_id, :area_id, :date_id, :fee).merge(user_id: current.user.id)
  end

end
