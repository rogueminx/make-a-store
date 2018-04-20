Rails.application.routes.draw do
  root :to => 'layouts#index'

  resources :products do
    resources :reviews
  end
end
