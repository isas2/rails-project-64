# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :posts, only: %i[create destroy edit new show update] do
    scope module: 'posts' do
      resources :comments, only: :create
      resources :likes, only: %i[create destroy]
    end
  end
end
