class OrdersController < ApplicationController
  def index
    @product = ProductListing.find(params[:item_id])
  end

  def create
  end
end
