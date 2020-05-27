Rails.application.routes.draw do

  root 'items#index'

  # 仮置き
  resources :items, except: :show

end
