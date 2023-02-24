Rails.application.routes.draw do
  constraints subdomain: /.*/ do
    resources :medics
  end

  resources :hospitals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
