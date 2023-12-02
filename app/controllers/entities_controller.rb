class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[index new create]

  def index
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params.merge(user: current_user))
    @entity.group_ids = params[:entity][:group_ids]

    if @entity.save
      redirect_to group_entities_path(@entity.groups.first), notice: 'Transaction successfully created!'
    else
      render :new
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
