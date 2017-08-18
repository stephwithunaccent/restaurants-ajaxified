Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants, only: [ :index, :show ] do
    resources :reviews, only: [:create, :destroy], shallow: true
  end
end
