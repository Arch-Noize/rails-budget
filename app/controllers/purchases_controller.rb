class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.includes(:purchases).find(params[:author_id])
    @purchases = @user.purchases
  end

  def show; end

  def new
    @user = current_user
    @purchase = @user.purchases.build
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end
