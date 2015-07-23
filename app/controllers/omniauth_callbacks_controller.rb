class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  [:google_oauth2, :facebook, :twitter, :linkedin].each do |function_name|
    define_method("#{function_name}") {generic_callback function_name}
  end

  def upgrade
    if Settings.provider.google == params[:provider]
      scope = "email, profile, offline, https://www.googleapis.com/auth/admin.directory.user"
    end

    redirect_to user_omniauth_authorize_path params[:provider], flash: {scope: scope}
  end

  def setup
    request.env["omniauth.strategy"].options["scope"] ||= flash[:scope]
    render text: t("Setup complete."), status: 404
  end

  private
  def generic_callback provider
    @identity = Identity.find_for_oauth env["omniauth.auth"]
    @user = @identity.user || current_user

    if @user.nil?
      @user = User.create email: @identity.email || ""
      @identity.update_attribute :user_id, @user.id
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute :email, @identity.email
    end

    if @user.persisted?
      @identity.update_attribute :user_id, @user.id
      @user = FormUser.find @user.id
      sign_in_and_redirect @user, event: :authentication

      if is_navigational_format?
        set_flash_message :notice, :success, kind: provider.capitalize
      end
    else
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
