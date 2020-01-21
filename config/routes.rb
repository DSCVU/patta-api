Rails.application.routes.draw do
  namespace :v1 do
    namespace :auth do
      post "sign_up", to: "registrations#create"
      delete "destroy", to: "registrations#destroy"
    end
  end
end
