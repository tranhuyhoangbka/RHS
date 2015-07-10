class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  has_many :addresses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :identities

  enum role: [:normal, :admin]

  def google_oauth2
    identities.where(provider: "google_oauth2").first
  end

  def google_oauth2_client
    unless @google_oauth2_client
      @google_oauth2_client = Google::APIClient
        .new application_name: "omniauth-google-oauth2"
      @google_oauth2_client.authorization
        .update_token!({access_token: google_oauth2.accesstoken,
        refresh_token: google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end
end
