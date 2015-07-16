RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.authorize_with :cancan
  config.excluded_models << "FormUser"

  config.actions do
    dashboard
    index
    new do
      except ["Comment", "Review"]
    end
    export
    bulk_delete
    show
    edit do
      except ["Comment", "Review"]
    end
    delete
    show_in_app
  end
end
