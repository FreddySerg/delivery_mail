TestApp::Application.routes.draw do
  root to: 'deliveries#index'

  resources :deliveries, only: [:index, :new, :create]
end
