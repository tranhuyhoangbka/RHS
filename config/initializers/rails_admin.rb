RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.authorize_with :cancan
  config.excluded_models = ["Identity", "Room", "FormUser"]

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

    nestable do
      visible do
        %w(Menu).include? bindings[:abstract_model].model_name
      end
    end
  end
end
