Rails.application.routes.draw do
  resources :registered_applications, except: [:edit, :update]

  devise_for :users
  
  root 'welcome#index'
end
