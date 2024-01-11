class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @groups = @user.groups.order(created_at: :desc)
  end

  def show; end

  def new
    @user = current_user
    @group = @user.groups.build
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
