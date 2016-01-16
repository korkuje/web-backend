Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lines, only: [:show, :index] do
        resources :problems, only: [:show, :index, :create]
      end
    end
  end
end
