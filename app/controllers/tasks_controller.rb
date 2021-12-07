class TasksController < ApplicationController

  before_action :set_tasks, except: [:index, :new, :create]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end


end
