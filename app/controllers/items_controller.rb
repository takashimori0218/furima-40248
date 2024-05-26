class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit, :update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :condition_id, :shipping_time_id, :image, :category_id, :shipping_fee_id, :prefecture_id).merge(user_id: current_user.id)
  end
end