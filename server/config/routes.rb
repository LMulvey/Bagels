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

  get '/404', :to => 'errors#not_found', :via => :all
  get '/500', :to => 'errors#server_error', :via => :all
end
