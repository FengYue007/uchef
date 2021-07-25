Rails.application.routes.draw do
  # REST :https://zh.wikipedia.org/wiki/%E8%A1%A8%E7%8E%B0%E5%B1%82%E7%8A%B6%E6%80%81%E8%BD%AC%E6%8D%A2
  resources :users, only: [:create] do
    collection do
      get :sign_up, action: 'new'
    end
  end

  resources :sessions, path: 'users', only: [] do
    collection do
      get :sign_in, action: 'new'
      post :sign_in, action: 'create'
    end
  end

  resources :restaurants

  root "restaurants#index"

  # get '/restaurants', to: 'restaurants#index'
  #
  # get '/new_restaurant', to: 'restaurants#new'
  #
  # post '/restaurant_list', to: 'restaurants#list'
end
