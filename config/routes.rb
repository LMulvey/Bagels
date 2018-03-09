Rails.application.routes.draw do
  
  namespace :api do
    # TODO: Restrict certain routes
    resources :drivers
    resources :tickets
    resources :events
  end

end
