class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @purchases = @group.purchases.order(created_at: :desc)
    @total_amount = @group.total
  end

  def new
    @user = current_user
    @purchase = @user.purchases.build
  end

  def create
    @purchase = @group.purchases.new(purchase_params)
    @purchase.author_id = current_user.id
    if @purchase.save
      GroupPurchase.create!(group: @group, purchase: @purchase)
      redirect_to group_purchases_path(@group), notice: 'Purchase was successfully added.'
    else
      render :new
    end
  end

  private

  def set_group
    @group = current_user.groups.includes(:purchases).find(params[:group_id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end
