require File.join(Rails.root, "services", "random_task.rb")

class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all

    render json: @todos
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors
    end
  end

  def destroy
    render json: {message: 'ToDo deleted!'} if Todo.find(params[:id])&.destroy
  end

  def random_task
    render json: RandomTask.generate
  end

  private

  def todo_params
    params.permit(:task, :description, :status)
  end
end
