class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_address
  before_action :find_review, except: :create

  respond_to :js

  def create
    @review = @address.reviews.build review_params
    @review.user = current_user
    @review.save
  end

  def destroy
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit :content, :image, :point
  end

  def find_address
    @address = Address.find params[:address_id]
  end

  def find_review
    @review = @address.reviews.find params[:id]
  end
end
