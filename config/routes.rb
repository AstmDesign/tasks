Rails.application.routes.draw do
  resources :tasks
  resources :projects
  devise_for :users

  # define home page
  root to: 'pages#home'
end
