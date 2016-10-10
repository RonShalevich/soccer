Rails.application.routes.draw do
  resources :events
  root 'teams#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :teams do
    resources :players
    resources :events
    resources :messages
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
