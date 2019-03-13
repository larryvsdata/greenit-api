Rails.application.routes.draw do
  namespace :api do
  #  resources :users
    resources :users do
      resources :comments
    end

    resources :replies
    resources :comments
    resources :comments do
      resources :replies
    end

    resources :topics

    resources :topics do
      resources :comments
    end

    resources :topics do
      resources :comments do
        resources :replies
      end
    end

    get 'user', to: 'users#show', as: 'user_show'
    post 'signup', to: 'users#create', as: 'user_signup'
    post 'login', to: 'users#login', as: 'user_login'

  end

end
