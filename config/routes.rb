Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/orders/:id/ship', to: 'orders#ship'

      resources :customers do
        resources :orders, only: [:index, :create]
      end
      resources :products, only: [:index, :show]
      
      resources :orders, only: [:index, :show, :create]   do
        resources :products, only: [:index, :create]
      end
      
    end
  end
end
