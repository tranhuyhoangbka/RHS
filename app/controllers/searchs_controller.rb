class SearchsController < ApplicationController
  def index
    @search = Address.search params[:q]

    @addresses = []

    if params[:q].reject {|k, v| v.blank?}.present?
      @sortings = Settings.sortings
      @search.build_condition if @search.conditions.empty?
      @addresses = @search.result.page params[:page]
    end
  end
end
