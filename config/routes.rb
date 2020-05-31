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
  resources :items, except: :show do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'edit_category_children', defaults: { format: 'json' }
      get 'edit_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
