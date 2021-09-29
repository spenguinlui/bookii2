Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 前台
  root "home#index"
  ## 搜尋
  post :search, to: "home#search"
  get :search_result, to: "home#search_result"
  ## 飯店專區
  resources :hotels, only: [:index] do
    resources :rooms do
      member do
        get :reservation
        post :booking
      end
    end
  end
  ## 會員專區
  resources :user do
    resources :booking_record do
      post :cancel, on: :member
    end
  end

  # 後台
  namespace :admin do
    root "home#index"
    resources :users_management do
      post :deposit, on: :member
    end
    resources :hotels do
      resources :rooms
    end
    resources :booking_records
  end
end
