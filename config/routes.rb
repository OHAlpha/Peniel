Rails.application.routes.draw do

  root 'application#home'
  get 'about', to: 'application#about'
  get 'news', to: 'application#news'
  get 'bible', to: 'application#bible'
  get 'media', to: 'application#media'
  get 'resources', to: 'application#resources'
  get 'contact', to: 'application#contact'

  #get 'administrator(/dashboard(.:format))', to: 'administrators#dashboard', as: :administrator
  resources :administrators, only: [ :show, :index ]
  resource :administrator, only: [ :new, :create, :edit, :update, :destroy ] do
    get 'dashboard'
  end

  #get 'developer(/dashboard(.:format))', to: 'developers#dashboard', as: :developer
  resources :developers, only: [ :show, :index ]
  resource :developer, only: [ :new, :create, :edit, :update, :destroy ] do
    root to: :dashboard
    get 'dashboard'
    get 'apply'
    get 'request', on: :new
    get 'index_table/:table', to: :index_table, as: :index_table
    get 'clear_table/:table', to: :clear_table, as: :clear_table
    get 'remove_row/:table/:id', to: :remove_row, as: :remove_row
    get 'reset_titles'
    get 'reset_suffixes'
    get 'add_admin'
    get 'setup_env'
    get 'show_session'
  end

  #get 'maintainer(/dashboard(.:format))', to: 'maintainers#dashboard', as: :maintainer
  resources :maintainers, only: [ :show, :index ]
  resource :maintainer, only: [ :new, :create, :edit, :update, :destroy ] do
    get 'dashboard'
  end

  #get 'user(/dashboard(.:format))', to: 'users#dashboard', as: :user
  resources :users, only: [ :show, :index ]
  resource :user, only: [ :new, :create, :edit, :update, :destroy ] do
    root to: :dashboard
    get 'dashboard'
    get 'login'
    post 'signin'
    get 'logout'
    get 'signup', on: :new
  end
  
  concern :likeable do
    resources :likes, except: [ :show, :edit, :update ]
  end
  
  concern :commentable do
    resources :comments, except: [ :show, :edit, :update ], concerns: :likeable
  end
  
  resources :news_categories
  resources :news_articles, concerns: [ :commentable, :likeable ] do
    collection do
      get 'search'
      post 'query'
    end
  end

  resources :bible_lesson_categories
  resources :bible_lessons, concerns: [ :commentable, :likeable ] do
    collection do
      get 'search'
      post 'query'
    end
  end

  resources :roles, :members, :organizations, :parties, :departments, :profiles, :addresses, :contacts

end
