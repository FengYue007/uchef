Rails.application.routes.draw do
  get '/restaurants', to: 'restaurants#index'

  get :new_restaurant, to: 'restaurants#new', path: 'ccc'

  post '/restaurant_list', to: 'restaurants#list'
end
