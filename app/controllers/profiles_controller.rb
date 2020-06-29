class ProfilesController < ApplicationController
  def new; end

  def create
    @profile = Profile.new(create_params)

    @profile.save
    redirect_to @profile
  end

  def show
    @profile = Profile.find(params[:id])
    @profile.increment!(:views)
  end

  def index
    @profiles = Profile.all
  end

  private

  def create_params
    params.require(:profile).permit(:name, :description, :avatar)
  end
end
