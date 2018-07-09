Rails.application.routes.draw do
  resources :comments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  
  root 'hello#home'
  get'about', to:'hello#about'
  
end
