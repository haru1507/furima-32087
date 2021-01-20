class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
