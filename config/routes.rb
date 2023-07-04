Rails.application.routes.draw do
  namespace :api do
    get 'todos', to: 'todos#index'
  end

  root 'homepage#index'
end
