Rails.application.routes.draw do
  
  namespace :api do
    resources :drivers, only: [:index]
    resources :tickets, only: [:index]
    resources :events, only: [:index]
  end

end
