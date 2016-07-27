Rails.application.routes.draw do
  root to: "welcome#show"
  get '/auth/linkedin',  as: :linkedin_login
  get '/auth/linkedin/callback' => "sessions#create"
end
