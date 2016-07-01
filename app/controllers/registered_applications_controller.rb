class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    if @registered_application.save
      flash[:notice] = "Application was saved."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the application."
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" has been deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end
  
  def index
    @registered_applications = RegisteredApplication.all.where(user_id: current_user.id)
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  private
    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end
end
