class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  # render plain:"Hello to rails! #{DateTime.now.to_s(:short)}"
   render plain: Todo.all.map{|todo| todo.to_pleasant_string}.join("\n")
   #render plain: Todo.all
  end
  def show
    id=params[:id]
    todo=Todo.find(id)
    #render plain:"The id you wanted  was #{id}"
    render plain:todo.to_pleasant_string

  end
  def create
    todo_text=params[:todo_text]
    due_date=DateTime.parse(params[:due_date])
    #create a todo
    new_todo=Todo.create!(todo_text:todo_text,due_date:due_date,completed:false)
   #render plain:"Hey this is the create action!"
  #render plain:"Hey ,the params are :#{params.to_s}"
   response_text="Hey,your new todo is created with the id#{new_todo.id}"
  render plain:response_text
  end
  def update
    id=params[:id]
    completed=params[:completed]
    todo=Todo.find(id)
    todo.completed=completed
    todo.save!
    render plain:"Updated todo completed status to #{completed}"
  end
end
