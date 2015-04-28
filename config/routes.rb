Rails.application.routes.draw do
  resources :examples

  root 'examples#index'
end
