# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :posts, except: [:index] do
    scope module: 'posts' do
      resources :comments
    end
  end
end
