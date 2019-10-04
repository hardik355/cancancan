Rails.application.routes.draw do
  get 'welcomes/index'
  resources :items
  resources :roles
  root to: "items#index"

  devise_for :users
    scope "/admin" do
    resources :users
  end

  authenticated :user do
    root :to => 'items#index', as: :authenticated_root
  end
  root :to => 'welcome#index'
  
end
