Rails.application.routes.draw do

  #search route is just for testing don't forget to delete
  get '/search', to: "search#index"

  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
