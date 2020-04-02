Rails.application.routes.draw do
  root to: "restaurants#index"

  resources :restaurants do # generates all the routes
    collection do
      # everything here it's going to be /restaurants/...
      get :top # it's the same as `get '/restaurants/top', to: 'restaurants#top'`
    end

    member do
      # everything here it's going to be /restaurants/:id/...
      get :chef # it's the same as `get '/restaurants/:id/chef', to: 'restaurants#chef'`
    end

    # when I use resources, I generate all the rest routes
    resources :reviews, only: [ :create, :destroy ]
    # POST '/restaurants/:restaurant_id/reviews/:id', to: 'reviews#create'
    # DELETE '/restaurants/:restaurant_id/reviews/:id', to: 'reviews#destroy'
  end
end
