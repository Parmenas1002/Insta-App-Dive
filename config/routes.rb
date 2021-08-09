Rails.application.routes.draw do
  root  "posts#index"
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :products do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
end
