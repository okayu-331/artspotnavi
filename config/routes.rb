Rails.application.routes.draw do
  devise_for :organizers, path: 'organizers', controllers: {
    sessions:      'organizers/sessions',
    passwords:     'organizers/passwords',
    registrations: 'organizers/registrations'
    }
  root "home#index"
  resources :home, only: :index
  resources :exhibitions do
    resources :events
  end
  resources :organizers, only: :show
end
