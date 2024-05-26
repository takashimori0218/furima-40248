class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create ]
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
       @order_form.save
        return redirect_to root_path
    else
       @item = Item.find(params[:item_id])
       #@order = @item.order
       render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :token, :user_id, :product_id, :postal_code, :prefecture, :city, :address, :building, :phone_number
    ).merge(user_id: current_user.id, product_id: params[:product_id])
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
end
