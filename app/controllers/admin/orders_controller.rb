class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  if @order_details.empty?
    flash[:notice] = "注文履歴がありません"
    redirect_to admin_top_path
  end
  end

  def update_status
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to request.referer
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      redirect_to request.referer
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
