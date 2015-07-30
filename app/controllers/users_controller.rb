class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @sort = params[:type]
    @addresses = if @sort.blank?
      @user.addresses.page params[:page]
    else
      @user.addresses.order_by_colunm(@sort["type"]).page params[:page]
    end
  end
end
