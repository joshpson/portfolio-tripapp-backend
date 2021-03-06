Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      get '/user', to: 'users#show_user'
      resources :trips, :bookmarks, :users
      get '/search' => 'trips#search'
      get '/categories' => 'trips#categories'
      get '/data' => 'trips#data'
      get '/directions' => 'trips#directions'
      get '/mapbox' => 'trips#mapbox'
      get '/mapboxtoken' => 'trips#mapboxtoken'
      get '/wikiphoto' => 'trips#wikiphoto'
    end
  end

end
