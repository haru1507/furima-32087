class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  # ログアウト状態のユーザー => 編集不可。ログインページへ。 => authenticate_user!
  # ログイン状態かつ出品者でないユーザー => 編集不可。トップページへ
  # ログイン状態かつ出品者のユーザー => 編集可能

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
