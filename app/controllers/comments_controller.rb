class CommentsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_review
  before_action :find_comment, except: [:index, :create]

  respond_to :js

  def index
    @comments = @review.comments.page params[:page]
  end

  def create
    @comment = @review.comments.build comment_params
    @comment.user = current_user
    @comment.save
  end

  def edit
  end

  def update
    @comment.update_attributes comment_params
  end

  def destroy
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit :content, :image
  end

  def find_review
    @review = Review.find params[:review_id]
  end

  def find_comment
    @comment = @review.comments.find params[:id]
  end
end
