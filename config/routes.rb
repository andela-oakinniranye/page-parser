Rails.application.routes.draw do
  resources :links#, only: [:show, :index, :create]
end
