Tshirt::Application.routes.draw do


  get "page/about", as: 'about'

  root :to => 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :questions do
    collection do
        get 'search'
        get 'unanswered'
    end
  end


  resources :collections

  resources :designs

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  ActiveAdmin.routes(self)

  resources :users
end
