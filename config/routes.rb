Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
    unauthenticated do
      root 'splashes#index', as: :unauthenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  resources :users
  end
  resources :categories, only: %i[index show edit new create update destroy ] do
    resources :records, only: %i[index show new create update destroy]
  end
end