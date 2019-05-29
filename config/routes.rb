Rails.application.routes.draw do
  devise_for :users

  # define home page
  root to: 'pages#home'
end
