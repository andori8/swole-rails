Rails.application.routes.draw do
  resources :comments
  resources :categories, only: [:index] do
    resources :exercises, only: [:index, :show]
  end
  resources :exercises
  resources :workouts
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#index'
  resources :exercise_workouts, only: [:create, :destroy]
end
