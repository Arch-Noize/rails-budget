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
    @groups = @user.groups
  end

  def create
    @purchase = current_user.purchases.new(purchase_params)
    @groups = current_user.groups
    if @purchase.save
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
    params.require(:purchase).permit(:name, :amount, group_ids: [])
  end
end
