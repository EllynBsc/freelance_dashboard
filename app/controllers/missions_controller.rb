
# require 'open-uri'
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
    # url = open("https://remotive.io/api/remote-jobs").read
    # @json_remotive =  JSON.parse(url)
    # @count_jobs = @json_remotive["job_count"]

    # @results = @json_remotive["jobs"].take(5).search do |job|
    #   Mission.create!(title: job['title'], description: job["description"].text, company:  job['company_name'], location: job["candidate_required_location"], url: job["url"], salary: job["salary"], user: current_user)
    #   # job['category']
    #   # job['tags']
    #   # job['job_type']
    #   # job["publication_date"]

    # end
    @results = RemotiveService.new.call(current_user)
    @missions = Mission.all.order(created_at: :asc)
  end

  def show
    @mission = Mission.find(params[:id])
  end

  private

  def mission_params
    params.require(:mission).permit(:company, :location, :favorite, :start_date,:end_date, :status, :title, :taggings_attributes => [:id,:tag_id])
  end


end
