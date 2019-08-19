Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers
      resources :products, only: [:index, :show]

      # list all orders
      get "orders", to: "orders#index"

      # list all orders for a customer
      get "customers/:customer_id/orders", to: "orders#index"

      # create an order for a customer
      post "customers/:customer_id/orders", to: "orders#create"

      # get a specific order
      get "orders/:id", to: "orders#show"

      # ship a specific order
      post "orders/:id/ship", to: "orders#ship"

      # list all products for an order
      get "orders/:order_id/products", to: "products#index"

      # add a produc to an order
      post "/orders/:order_id/products", to: "products#create"

      # limit new routes to only the ones expected above
      resources :orders, only [:index, :create, :show, :ship]
    end
  end
end
