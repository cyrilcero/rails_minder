Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resource :tasks
  end


  root "categories#index"
end
