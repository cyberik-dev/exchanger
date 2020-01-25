# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'currency_pairs#index'

  devise_for :users
  resources :currency_pairs
end
