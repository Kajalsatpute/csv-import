Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'entry', to: 'users#index', as: :login
  # match 'users', to: 'users#show', via: [:get, :post]
  root "users#index"
  resources :users do
    collection do
      post :import
    end
  end
end
