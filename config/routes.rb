Rails.application.routes.draw do
  root to: "welcome#show"
  get '/auth/linkedin',  as: :linkedin_login
  get '/auth/linkedin/callback' => "sessions#create"
  delete '/logout' => 'sessions#destroy', as: :logout

  get '/:username' => "users#show", as: :user
end
