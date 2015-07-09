Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, path_names: {sign_in: "login", sign_up: "register"}
end
