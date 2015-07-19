class ReviewsController < ApplicationController
  before_action :set_address, :authenticate_user!

  def create
    @review = @address.reviews.build review_params
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.js
      else
        flash[:danger] = t "review.create_fail"
      end
      format.html {redirect_to @address}
    end
  end

  private
  def review_params
    params.require(:review).permit :user_id, :address_id, :content, :image
  end

  def set_address
    @address = Address.find params[:address_id]
  end
end
