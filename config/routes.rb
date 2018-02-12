Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#root'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :publishers, :series, :issues, :writers, :artists
  namespace :api do
    namespace :v1 do
      namespace :issues do
        get "/search/:query", action: 'search', as: 'search'
      end
    end
  end
end
