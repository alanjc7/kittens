class LikesController < ApplicationController
  def new; end

  def create
    @profile = Profile.find(params[:profile_id])
    @like = @profile.likes.create(create_params)
    redirect_to profile_path(@profile)
  end

  private

  def create_params
    score = params[:commit] == 'Meow!' ? 1 : -1
    params[:like][:score] = score
    params.require(:like).permit(:by, :score)
  end
end
