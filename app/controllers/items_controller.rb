class ItemsController < ApplicationController
  before_action :move_to_session, only: :new
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

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
