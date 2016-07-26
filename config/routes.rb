Rails.application.routes.draw do
  root to: "welcome#show"
  get '/oauth/v2/authorization',  as: :linkedin_login

end
