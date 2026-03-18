Rails.application.routes.draw do
  get "palettes/show"
  get "palettes/edit"
  get "palettes/update"
  get "palettes/destroy"
  get "collections/index"
  get "collections/show"
  get "collections/new"
  get "collections/create"
  get "collections/edit"
  get "collections/update"
  get "collections/destroy"
  get "pages/home"
  devise_for :users

  resources :collections do
    resources :palettes, shallow: true
  end

  resources :palettes, only: [:show, :edit, :update, :destroy] do
    resources :colors, only: [:update]
  end

  root "pages#home"
end
