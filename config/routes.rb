Rails.application.routes.draw do
  resources :events
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :teams do
    resources :players
    resources :events
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
