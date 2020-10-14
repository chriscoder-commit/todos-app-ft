class TodosController < ApplicationController
  before_action :set_todo, only: %i[show destroy]
  skip_before_action :verify_authenticity_token

  def index
    @todos = Todo.all
  end

  def show
  end

  def create
    Todo.create(name: params[:name], done: params[:done])
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
