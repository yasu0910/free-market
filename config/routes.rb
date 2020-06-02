Rails.application.routes.draw do

  root 'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  }
  devise_scope :user do
    get 'signup', to: 'users/registrations#signup'
    get 'delivery_info', to: 'users/registrations#new_delivery_info'
    post 'delivery_info', to: 'users/registrations#create_delivery_info'
  end


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
  end
end
