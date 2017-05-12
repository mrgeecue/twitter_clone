Rails.application.routes.draw do
  root to: 'sessions#index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/users/index' => '/users/index'
  get '/posts/show'
  post '/posts' => 'posts#create'
  get 'users/index'
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
