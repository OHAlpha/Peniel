Rails.application.routes.draw do
  
  concern :tagged do
    resources :tags, only: [ :index ]
  end
  
  concern :taggable do
    resources :tags, except: [ :show, :edit, :update ]
  end
  
  concern :likeable do
    resources :likes, except: [ :show, :edit, :update ]
  end
  
  concern :commentable do
    resources :comments, except: [ :show, :edit, :update ], concerns: :likeable
  end
  
  # visitor and user functionality
  root 'application#home'
  get 'about', to: 'application#about'
  scope module: 'visitor' do
    resources :bible, :news, :events, :media, :resources, concerns: [ :tagged, :likeable, :commentable ]
    resources :departments do
      resources :contacts
    end
  end
  
  # user and member functionality
  resource :user, module: 'user'
  namespace :user do
    resources :persons
  end
  
  # developer functionality
  resource :developer, module: 'developer'
  namespace :developer do
    resources :visitors, :developers, :members, :maintainers, :adminstrators
    resources :persons do
      resources :relationships
    end
    resources :users do
      resources :contacts
    end
    resources :relationships, :contacts
    resources :bible_articles, :news_articles, :events, :images, :sounds, :videos, :resources, concerns: [ :taggable, :likeable, :commentable ]
    resources :bible_categories, :news_categories, :tags
  end
  
  # maintainer functionality
  resource :maintainer, module: 'maintainer'
  
  # admin functionality
  resource :admin, module: 'admin'
  
end
