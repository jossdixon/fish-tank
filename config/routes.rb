Rails.application.routes.draw do
  root to: "aquatics#index"
  resources :aquatics
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
