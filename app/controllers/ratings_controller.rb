class RatingsController < ApplicationController
  def index
    @ratings = Rating.all.order(created_at: :desc)
  end

  def show
    @ratings = Rating.find params(:id)
  end

  def create
    rating = Rating.new(rating_params)
    if rating.save
      redirect_to (rating)
    else
      redirect_to (rating), :notice "Error when trying to save your Rating"
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
