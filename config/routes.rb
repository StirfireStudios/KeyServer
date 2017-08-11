Rails.application.routes.draw do
  resources :keys, only: [:index, :create, :show] do
    post :redeem
  end

  root to: "keys#index"
end
