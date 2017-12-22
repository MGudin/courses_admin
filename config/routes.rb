Rails.application.routes.draw do
  devise_for :users
  # resources :students
  # resources :exams, only: [:index]
  # resources :courses
  # resources :grades, only: [:index]
  # resources :students, only: [:index]
  resources :courses do
    resources :exams, only: [:index, :new, :create]
    resources :students
  end

  resources :exams, only: [:show, :edit, :update, :destroy] do
    resources :grades
  end
  root "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
