Rails.application.routes.draw do
  namespace :api do
    get 'todos', to: 'todos#index'
    post '/todos/create', to: 'todos#create'
    delete '/todos/destroy/:id', to: 'todos#destroy'
  end

  root 'homepage#index'
end
