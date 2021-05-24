Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
  resources :user, only: [:new, :create]
  resources :session, only: [:new] do
    post 'login', to: "session#login", as: :login, on: :collection
  end
  resources :post, only: [:new, :create, :edit, :update, :destory]
end
