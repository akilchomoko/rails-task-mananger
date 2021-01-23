class TasksController < ApplicationController
  # first try!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit; end

  def update
    @task.update(task_params_check)
    redirect_to tasks_path
  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def task_params_check
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
