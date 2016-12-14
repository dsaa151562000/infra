Rails.application.routes.draw do
  devise_for :users, controllers: {
  	sessions:      "users/sessions",
  	registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root :to => "blogs#index"
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
