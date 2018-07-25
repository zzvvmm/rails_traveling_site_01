Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    resources :chatrooms, param: :slug
    resources :messages
    mount ActionCable.server => "/cable"
  end
end
