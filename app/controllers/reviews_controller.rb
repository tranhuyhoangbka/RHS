class ReviewsController < ApplicationController
  before_action :find_address, :authenticate_user!

  def create
    @review = @address.reviews.build review_params
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def review_params
    params.require(:review).permit :content, :image, :point
  end

  def find_address
    @address = Address.find params[:address_id]
  end
end
