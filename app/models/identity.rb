class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_for_oauth auth
    identity = find_by provider: auth.provider, uid: auth.uid
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity.accesstoken = auth.credentials.token
    identity.refreshtoken = auth.credentials.refresh_token
    ["name", "email", "nickname", "image", "phone"].each do |method_name|
      identity.send("#{method_name}=", auth.info.send("#{method_name}"))
    end
    identity.urls = (auth.info.urls || "").to_json
    identity.save
    identity
  end
end
