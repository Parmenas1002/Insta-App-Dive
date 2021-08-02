Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show]
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
end
