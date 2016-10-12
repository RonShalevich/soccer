Rails.application.routes.draw do
  root 'teams#index'
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    get '/demo' => :demo, on: :collection
  end
  resources :teams do
    resources :players
    resources :events
    resources :messages
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
