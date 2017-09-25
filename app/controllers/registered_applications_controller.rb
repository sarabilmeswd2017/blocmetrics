class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = current_user.registered_applications
  end

  def show
    @registered_applications = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_applications = RegisteredApplication.new
  end

  def create
    @registered_applications = current_user.registered_applications.new(registered_application_params)
    if @registered_applications.save
      flash[:notice] = "Application was saved."
        redirect_to registered_applications_path
    else
      flash[:alert] = "There was an error saving your application."
        render :new
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:registered_application).permit(:name, :url, :user)
  end
end
