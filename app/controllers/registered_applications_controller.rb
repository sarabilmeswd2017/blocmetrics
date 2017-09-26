class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = current_user.registered_applications
  end


  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.new(registered_application_params)
    if @registered_application.save
      flash[:notice] = "Application was saved."
        redirect_to root_path

    else
      flash[:alert] = "There was an error saving your application."
        render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Application was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      redirect_to root_path
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url, :user)
  end
end
