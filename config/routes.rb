Rails.application.routes.draw do
  root "welcome#index"
  resources :articles do
    get 'new_comment'
    post 'create_comment'
    post 'vote'

    resources :comments do
      get "new_reply"
      post "reply"
      post "vote"
    end
  end

  resources :users

  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end
