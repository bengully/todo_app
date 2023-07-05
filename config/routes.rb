Rails.application.routes.draw do
  namespace :api do
    get 'todos', to: 'todos#index'
    post '/todos/create', to: 'todos#create'
  end

  root 'homepage#index'
end
