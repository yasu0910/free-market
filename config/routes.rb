Rails.application.routes.draw do

  root 'items#index'

  # 仮置き
  resources :items, except: :show do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
