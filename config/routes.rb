Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/me', to: 'auth#show'
      post '/login', to: 'auth#create'

      get '/getusers', to: 'users#index'
      post '/signup', to: 'users#create'
      put '/uploadphoto', to: 'users#upload_photo'

      get '/getposts', to: 'posts#index'
      post '/newpost', to: 'posts#create'
      delete '/deletepost', to: 'posts#destroy'

      post '/getfriendslist', to: 'friends#friends_list'
      post '/getrequestedfriendslist', to: 'friends#requested_friends_list'
      post '/getpendingfriendslist', to: 'friends#pending_friends_list'

      post '/sendfriendrequest', to: 'friends#send_friend_request'
      post '/acceptfriendrequest', to: 'friends#accept_friend_request'
      delete '/removefriend', to: 'friends#destroy'

      resources :users
      resources :posts
    end
  end

  get '/', to: 'application#index'
end
