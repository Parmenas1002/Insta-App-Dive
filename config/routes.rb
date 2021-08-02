Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
end
