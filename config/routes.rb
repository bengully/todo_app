Rails.application.routes.draw do
  namespace :api do
    get 'todos', to: 'todos#index'
    post '/todos/create', to: 'todos#create'
    delete '/todos/destroy/:id', to: 'todos#destroy'
    get '/todos/random_task', to: 'todos#random_task'
  end

  root 'homepage#index'
end
