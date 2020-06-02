Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  }
  devise_scope :user do
    get 'signup', to: 'users/registrations#signup'
    get 'delivery_info', to: 'users/registrations#new_delivery_info'
    post 'delivery_info', to: 'users/registrations#create_delivery_info'
  end

  root 'items#index'

  # 仮置き
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'edit_category_children', defaults: { format: 'json' }
      get 'edit_category_grandchildren', defaults: { format: 'json' }
    end
    resources :card do
      member do
        post 'buy' ,to: 'card#buy'
        post 'pay', to: 'card#pay'
        get 'confirm'
      end
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :users, only: [:show] do
  end
end

