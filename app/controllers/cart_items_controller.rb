class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "成功将商品 #{@product.title} 从购物车删除！"
    redirect_to carts_path
  end

  def edit
    @cart_item = current_cart.cart_items.find(params[:id])
  end

  def update
    @cart_item = current_cart.cart_items.find(params[:id])
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = "成功变更数量"
    else
      flash[:warning] = "数量不足以加入购物车"
    end
    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
