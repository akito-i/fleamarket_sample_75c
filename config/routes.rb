Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :items, only:[:index, :new]
  resources :users
  
  resources :item_detail, only: [:index]
end
