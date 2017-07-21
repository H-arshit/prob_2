class TodosController < ApplicationController
 
  before_action :set_todo, only: [:edit, :update]


 def index


  @todos =  Todo.all

  end

  def edit

  end

  def new

    @todo = Todo.new

  end

  def create

    todo = params["todo"]

    todo = todo.permit(:title, :content,:importance,:deadline)


    @todo = Todo.new(todo)

    has_saved = @todo.save


    unless has_saved
      render :new
    else
      redirect_to '/todos/index'
    end

  end

  def show
  end

  def destroy
  end

  def update

    byebug

    todo = params["todo"]
    todo = todo.permit(:title, :content,:importance,:deadline)
    is_update =  @todo.update(todo)
  
    unless is_update
      render :edit
    else
      redirect_to '/todos/index'
    end



  end


   private 
  def set_todo
      puts "set_Todo"
        @todo = Todo.where(id: params["id"]).first
  end

 
end
