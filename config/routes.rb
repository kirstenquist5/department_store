Rails.application.routes.draw do
  root 'departments#index'

  resources :department do
    resources :items
  end
end
