class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
      if @user_order.valid?
        @user_order.save
        redirect_to root_path
      else
        render 'index'
      end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
