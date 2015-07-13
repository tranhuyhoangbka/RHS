class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    generic_callback Settings.provider.google
  end

  def facebook
    generic_callback Settings.provider.facebook
  end

  def twitter
    generic_callback Settings.provider.twitter
  end

  def linkedin
    generic_callback Settings.provider.linkedin
  end

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

  def upgrade
    if params[:provider] == Settings.provider.google
      scope = "email, profile, offline, https://www.googleapis.com/auth/admin.directory.user"
    end
    redirect_to user_omniauth_authorize_path params[:provider],
      flash: {scope: scope}
  end

  def setup
    request.env["omniauth.strategy"].options["scope"] ||= flash[:scope]
    render text: t("Setup complete."), status: 404
  end
end
