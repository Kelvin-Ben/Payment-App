Rails.application.routes.draw do
  # resources :category_records
  # resources :records
  # resources :categories

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
    unauthenticated do
      root 'splashes#index', as: :unauthenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  resources :users, only: [:index]
  end
  resources :categories do 
    # resources :records, except: [:index]
    resources :records
  end
end