class TodosController < ApplicationController

    def index
        @todos = Todo.ordered
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            respond_to do |format|
                format.html {redirect_to todo_path(@todo)}
                format.turbo_stream
            end
        else
            render :new
        end
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            respond_to do |format|
                format.html {redirect_to todo_path(@todo)}
                format.turbo_stream
            end
        else
            render :edit
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        respond_to do |format|
            format.html {redirect_to todos_path}
            format.turbo_stream
        end
    end

    private
    def todo_params
        params.require(:todo).permit(:todo)
    end
end
