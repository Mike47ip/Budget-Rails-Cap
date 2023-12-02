class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.includes(:icon_attachment)
  end

  def show
    @group = current_user.groups.find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
    @total_amount = @entities.sum(:amount)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      # Create join record
      GroupUser.create(user: current_user, group: @group)

      redirect_to groups_path, notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
