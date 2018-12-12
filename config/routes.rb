Rails.application.routes.draw do
  resources :categories, only: [:index] do
    resources :exercises, only: [:index, :show]
  end
  get '/exercises/ten', to: 'exercises#ten', as: 'ten_exercises'
  get '/home', to: 'workouts#home', as: 'my_workouts'
  resources :exercises
  resources :workouts do
    resources :comments, only: [:index, :create, :edit, :update]
    resources :comments, only: [:destroy], as: "destroy_comment"
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  root 'welcome#index'
  resources :exercise_workouts, only: [:create, :destroy]
  get '/exercises/:id/next', to: 'exercises#next'
end
