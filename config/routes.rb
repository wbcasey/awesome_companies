Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "user/sessions",
    registrations: "user/registrations",
    passwords: "user/passwords",
    unlocks: "user/unlocks",
    confirmations: "user/confirmations"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "devise/registrations#new"
    resource :dashboard, controller: "dashboard"
  end
end
