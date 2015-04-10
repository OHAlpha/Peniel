Rails.application.routes.draw do

  root 'application#home'

  get 'about' => 'application#about'

  get 'developer(/index(.:format))' => 'developers#dashboard'
  
  resources :developers
  
  resource :developer do
    get 'index_table/:table' =>  :index_table
    get 'clear_table/:table' =>  :clear_table
    get 'remove_row/:table/:id' =>  :remove_row
    get 'reset_titles'
    get 'reset_suffixes'
    get 'add_admin'
  end

  get 'developer(/index(.:format))' => 'users#dashboard'

  resources :users
  
  resource :user do
    get 'login'
    post 'signin'
    get 'logout'
    get 'signup'
  end

  resources :roles

  resources :members

  resources :organizations

  resources :parties

  resources :departments

  resources :profiles

  resources :addresses

  resources :contacts

end
