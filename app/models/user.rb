class User < ActiveRecord::Base
  include RailsAdmin::User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable
  has_many :addresses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :identities
  
  ratyrate_rater
  
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

  def facebook
    identities.where(provider: Settings.provider.facebook).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client access_token: facebook.accesstoken
  end

  def twitter
    identities.where(provider: Settings.provider.twitter).first
  end

  def twitter_client
    @twitter_client ||= Twitter.client access_token: twitter.accesstoken
  end

  def linkedin
    identities.where(provider: Settings.provider.linkedin).first
  end

  def linkedin_client
    @linkdin_client ||= Linkedin.client access_token: linkedin.accesstoken
  end
end
