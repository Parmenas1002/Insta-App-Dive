Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
end
