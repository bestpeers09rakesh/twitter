Rails.application.routes.draw do
  get 'profile/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
  get 'home/your-tweet', to: "home#user_tweet", as: :user_tweet
  post 'home/post/:id/comment', to: "home#create_comment", as: :user_comment
  get 'home/follow', to: "home#user_follow", as: :user_follow

  get 'home/like/post/:id', to: "home#like", as: :post_like
  get 'home/unlike/post/:id', to: "home#unlike", as: :post_unlike
  get 'home/like-post/', to: "home#like_post", as: :like_post

  get 'home/follow/post/user/:id', to: "home#follow", as: :follow
  get 'home/unfollow/post/user/:id', to: "home#unfollow", as: :unfollow

  get 'profile/', to: "profile#show", as: :profile_show
  get 'profile/edit', to: "profile#edit", as: :profile_edit
  put 'profile/update', to: "profile#update", as: :profile_update

  resources :user, only: [:new, :create]

  resources :session, only: [:new] do
    post '', to: "session#login", as: :login, on: :collection
    delete 'logout', to: "session#logout", as: :logout, on: :collection
  end

  resources :post, only: [:new, :create, :edit, :update, :destory]
end
