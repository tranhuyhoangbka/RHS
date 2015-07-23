class RegistrationsController < Devise::RegistrationsController
  private
  def account_update_params
    params.require(:user).permit User::PARAMS_ATTRIBUTES
  end
end
