class MissionsController < ApplicationController
  def new
    @mission = Mission.new
    @mission.taggings.build
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user

    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    @mission.update(mission_params)
    if @mission
      redirect_to missions_path
    else
      render :edit
    end
  end

  def destroy
   @mission = Mission.find(params[:id])
   @mission.destroy
   redirect_to missions_path
  end

  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])
  end

  private

  def mission_params
    params.require(:mission).permit(:company, :location, :favorite, :start_date,:end_date, :status, :title, :taggings_attributes )
  end


end
