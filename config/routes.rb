Rails.application.routes.draw do
  # Error handling
  match "/404", to: "error/errors#not_found", via: :all
  match "/500", to: "error/errors#internal_server_error", via: :all

  get '/rest/docs' => redirect('/swagger/dist/index.html?url=/oas.json')

  namespace :v1 do
    namespace :auth do
      post "sign_up", to: "registrations#create"
      delete "destroy", to: "registrations#destroy"
      post "sign_in", to: "sessions#create"
      get "validate_token", to: "sessions#validate_token"
    end
  end
end
