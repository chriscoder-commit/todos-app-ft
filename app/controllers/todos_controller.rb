class TodosController < ApplicationController
  before_action :todos
  before_action :set_todo, only: [:show]
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
  end

  def create
    new_todo = {
      'id' => params[:id].to_i,
      'name' => params[:name],
      'done' => to_bool(params[:done])
    }
    @todos << new_todo
    write_todos
    redirect_to todos_path
  end

  private

  def set_todo 
    id = params[:id].to_i
    @todo = @todos.find do |todo|
      id == todo['id']
    end
  end

  def to_bool(bool)
    bool == 'true'
  end

  def todos
    @todos = JSON.parse(File.read('/Users/harrisonmalone/Desktop/todos-app-ft/public/todos.json'))
  end

  def write_todos
    path = '/Users/harrisonmalone/Desktop/todos-app-ft/public/todos.json'
    File.write(path, JSON.pretty_generate(@todos))
  end
end
