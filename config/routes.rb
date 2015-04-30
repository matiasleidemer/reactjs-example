Rails.application.routes.draw do
  resources :meetups
  resources :examples

  root 'meetups#new'
end
