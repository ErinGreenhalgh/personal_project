Rails.application.routes.draw do
  root to: "welcome#show"
  get '/auth/linkedin',  as: :linkedin_login
  get '/auth/linkedin/callback' => "sessions#create"
  delete '/logout' => 'sessions#destroy', as: :logout

  get '/:username' => "users#show", as: :user

  scope '/:username' do
    get '/profile_summary' => 'profile_summaries#show', as: :profile_summary
    get '/profile_summary/create_report' => 'profile_summaries#create_report', as: :create_report
    patch '/profile_summary/create_report' => 'profile_summaries#create_report'
  end

  scope '/profile_summary' do
    resources :reports, only: [:show, :index]
  end

end
