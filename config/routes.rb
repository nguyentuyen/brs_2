Brs2::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :positions
  resources :teams
  resources :projects
  resources :skills
  resources :activities
  resources :reports
  namespace :admin do
  	match "/signin", to: "sessions#new", via: "get"
    match "/signout", to: "sessions#destroy", via: "delete"
  	resources "sessions", only: [:new, :create, :destroy]
  	resources "users"
    match "csvs", to: "csvs#index", via: :get
    match "csvs/import", to: "csvs#import", via: :post
    match "csvs/export", to: "csvs#export", via: :get
    resource "members"
  end
  root "static_pages#home"
  match "/help", to: "static_pages#help", via: "get"
  match "/about", to: "static_pages#about", via: "get"
  match "/contact", to: "static_pages#contact", via: "get"
  match "/signin",  to: "sessions#new",         via: "get"
  match "/signout", to: "sessions#destroy",     via: "delete"
end
