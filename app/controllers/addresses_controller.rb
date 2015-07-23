class AddressesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_address, only: [:show, :edit, :destroy]

  def index
    @addresses = Address.all.page params[:page]
    @address = Address.new
    @recent_addresses = Address.last Settings.num_of_recent_addresses

    @search = Address.search params[:q]

    @regions = []

    Settings.special_locations.each{|pro| @regions << Address.by_province(pro.last)}
  end

  def show
    @address = Address.find params[:id]
    @recent_addresses = Address.last Settings.num_of_recent_addresses
  end

  def new
    @address = Address.new
    @image = @address.images.build
  end

  def create
    @address = Address.new address_params

    if @address.save
      redirect_to root_path, notice: t("address.create")
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit :id, :lng, :lat, :capacity, :contact,
      :description, :type, images_attributes: [:id, :photo, :_destroy]
  end

  def find_address
    @address = Address.find params[:id]
  end
end
