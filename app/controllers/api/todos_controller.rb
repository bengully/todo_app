class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all

    render json: @todos
  end

  def create
  end

  def destroy
  end
end
