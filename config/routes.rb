Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'
  resources :items do
    collection do
      get 'search_child', defaults: { format: 'json' }
      get 'search_grandchild', defaults: { format: 'json' }
      get 'update_done'
    end
    member do
      get 'select_category_index'
      get 'confirm'
    end
  end

  resources :users
  resources :credit_cards, only: [:index, :new, :create, :destroy, :buy] do
    get 'buy', on: :member
  end
end

