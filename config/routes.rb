Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: :auth }

  resources :tokens, only: [:index, :destroy]

  post "/api/me" => "api#register"
  get  "/api/me" => "api#me"

  root to: "pages#home"
end
