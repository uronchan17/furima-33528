class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @product_listings = ProductListing.all.order('created_at DESC')
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

  def show
    set_product_listing
  end

  def edit
    set_product_listing
    redirect_to root_path unless current_user.id == @product_listing.user_id
  end

  def update
    set_product_listing
    if @product_listing.update(items_params)
      redirect_to item_path(@product_listing.id)
    else
      render :edit
    end
  end

  private

  def set_product_listing
    @product_listing = ProductListing.find(params[:id])
  end

  def items_params
    params.require(:product_listing).permit(:product_name, :explain, :category_id, :state_id, :delivery_fee_id, :area_id,
                                            :days_to_ship_id, :fee, :image).merge(user_id: current_user.id)
  end
end
