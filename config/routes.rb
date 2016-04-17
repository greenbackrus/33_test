Rails.application.routes.draw do

  resources :lessons
  resources :disciplines
  resources :courses
  resources :lections
  resources :homeworks

  root 'index#index'

end
