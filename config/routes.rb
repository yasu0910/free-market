Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'delivery_info', to: 'users/registrations#new_delivery_info'
    post 'delivery_info', to: 'users/registrations#create_delivery_info'
  end

  root 'items#index'

end
