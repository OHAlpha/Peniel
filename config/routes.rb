Rails.application.routes.draw do

  resources :roles

  resources :members

  resources :organizations

  resources :parties

  resources :departments

  resources :profiles

  resources :addresses

  resources :contacts

  resources :users

  root 'application#home'

end
