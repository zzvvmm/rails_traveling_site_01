Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users, only: [:new, :create]
    resources :trips, only: [:new, :create, :show] do
      resources :participations, only: [:create, :destroy]
      resources :searchs, only: :index
    end
    get "/about", to: "static_pages#about"
    resources :chatrooms, param: :slug
    resources :messages
    resources :reviews
    get "hastags/:title", to: "hastags#show", as: :hastag
    mount ActionCable.server => "/cable"
    mount Ckeditor::Engine => "/ckeditor"
  end
end
