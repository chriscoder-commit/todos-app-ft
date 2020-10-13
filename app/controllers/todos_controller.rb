class TodosController < ApplicationController
  before_action :todos
  skip_before_action :verify_authenticity_token

  def index
    render json: @todos
  end

  def show
    id = params[:id].to_i
    found_todo = @todos.find do |todo|
      id == todo['id']
    end
    render json: found_todo
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
