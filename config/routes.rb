Rails.application.routes.draw do
  
  namespace :api do
    # TODO: Restrict certain routes
    resources :drivers do
      resource :tickets
    end
    resources :tickets
    resources :events do
      resource :ticket
    end
  end

end
