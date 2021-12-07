# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :posts, only: %i[show new create] do
    resources :comments, module: :posts, only: %i[create]
  end
end
