Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ExceptionHunter.routes(self)

  root to: 'admin/dashboard#index'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'

      resources :settings, only: [] do
        get :must_update, on: :collection
      end
    end
  end
end
