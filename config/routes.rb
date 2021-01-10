Rails.application.routes.draw do
  root "home#top"

  get "login" => "users#login"
  post "login" => "users#login_go"
  get "regist" => "users#regist"
  post "logout" => "users#logout"
  get "timeline" => "timeline#index"
  get "privatetimeline" => "timeline#privateindex"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/followindex/:id" => "users#followindex"
  get "users/followerindex/:id" => "users#followerindex"
  get "users/:id/edit" => "users#edit"
  post "users/:id/change" => "users#change"
  get "top" => "home#top"
  get "timeline/new" => "timeline#new"
  get "timeline/:id" => "timeline#show"
  post "timeline/create" => "timeline#create"
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
