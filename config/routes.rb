Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :tasks, except: [:index]
  end

  root "categories#index"
end
