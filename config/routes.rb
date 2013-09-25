Tshirt::Application.routes.draw do

  get "page/about", as: 'about'

  root :to => 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :answers
  resources :questions do
    resources :answers
    collection do
        get 'search'
        get 'unanswered'
    end
    member do
        get 'downvote'
        get 'upvote'
        get 'delete_attachment'
    end
  end

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  ActiveAdmin.routes(self)

  resources :users
end
