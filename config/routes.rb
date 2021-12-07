# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :posts, only: %i[show new create] do
    resources :comments, module: :posts, only: %i[create]

    resources :likes, module: :posts, only: %i[create] do
      delete 'destroy', on: :collection, as: 'destroy'
    end
  end
end
