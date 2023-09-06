class TasksController < ApplicationController
  before_action :prepare_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all.order(status: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      @task.broadcast_prepend_to 'tasks-channel', target: 'task-collection', partial: 'tasks/task'
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!

    redirect_to tasks_path
  end

  private

  def prepare_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :name,
      :status,
      :body
    )
  end
end
