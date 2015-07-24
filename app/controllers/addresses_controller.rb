class AddressesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_address, only: [:show, :edit, :destroy]

  def index
    @addresses = Address.all.page params[:page]
    @address = Address.new
    @recent_addresses = Address.last Settings.num_of_recent_addresses

    @search = Address.search params[:q]

    @regions = []

    if params[:province].nil? 
      Region.get_special.each{|pro| @regions << Address.by_province(pro
        .province).last(Settings.num_of_address_by_regions)}
    else
      @regions << Address.by_province(params[:province])
    end
  end

  def show
    @address = Address.find params[:id]
    @recent_addresses = Address.last Settings.num_of_recent_addresses
    @review = @address.reviews.build
  end

  def new
    @address = Address.new
    @image = @address.images.build
  end

  def create
    @address = Address.new address_params

    if @address.save
      redirect_to new_address_path, notice: t("address.create")
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit :id, :lng, :lat, :capacity, :contact,
      :description, :type, :facility, :square, :address, :price, :parking,
      :air_conditioner, :ceilling_fan, :bed, :washing_machine, :television,
      :network, :table, :chair,
      images_attributes: [:id, :photo, :main, :_destroy]
  end

  def find_address
    @address = Address.find params[:id]
  end
end
