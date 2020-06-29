class ProfilesController < ApplicationController
  SORTABLE_VALUES = %i[ranking_score created_at].freeze

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
    sort = (SORTABLE_VALUES & [params.dig(:q, :s)&.to_sym]).first || :created_at
    @profiles = Profile.all.sort_by(&sort).reverse
  end

  private

  def create_params
    params.require(:profile).permit(:name, :description, :avatar)
  end
end
