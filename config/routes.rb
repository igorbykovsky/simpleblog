Rails.application.routes.draw do
  devise_for :users
  # root 'posts#index', as: 'home'
  root to: 'posts#index'

  get 'about' => 'pages#about'

  resources :posts, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :posts, except: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
