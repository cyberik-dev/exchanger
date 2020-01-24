# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'currency_pairs#index'

  resources :currency_pairs
end
