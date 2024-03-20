class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_order_id

  def show
    @order_details = @order.order_details
  if @order_details.empty?
    flash[:info] = "注文履歴がありません"
    redirect_to admin_top_path
  end
  end

  def update_status
    if @order.update(order_params)
      flash[:success] = "注文ステータスを更新しました"
      redirect_to request.referer
    else
      flash[:success] = "注文ステータスの更新に失敗しました"
      redirect_to request.referer
    end
  end


  private

  def find_order_id
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
