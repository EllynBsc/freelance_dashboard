Rails.application.routes.draw do

  devise_for :users

  resources :missions
  resources :notes
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
