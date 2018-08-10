Rails.application.routes.draw do
  resources :categories, only: [:index] do
    resources :exercises, only: [:index, :show]
  end
  resources :exercises
  resources :workouts do
    resources :comments, only: [:new, :create, :edit, :update]
    resources :comments, only: [:destroy], as: "destroy_comment"
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'workouts#index'
  resources :exercise_workouts, only: [:create, :destroy]
end
