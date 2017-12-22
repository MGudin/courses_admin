Rails.application.routes.draw do
  devise_for :users
  # resources :students
  # resources :exams, only: [:index]
  # resources :courses
  # resources :grades, only: [:index]
  # resources :students, only: [:index]
  resources :courses do
    resources :exams do
      resources :grades
    end
    resources :students
  end
                                  
  root "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
