Rails.application.routes.draw do

  get '/oauth/v2/authorization',  as: :linkedin_login
  
end
