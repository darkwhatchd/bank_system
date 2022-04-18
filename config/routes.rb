Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }

  resources :transfers, only: %i[new create show]
  resources :withdrawals, only: %i[new create show]
  resources :deposits, only: %i[new create]
  resources :statements, only: %i[new create show]
end
