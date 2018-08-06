Rails.application.routes.draw do
  resources :exercise_workouts, only: [:create, :destroy]
  resources :exercises
  resources :workouts
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#index'
end
