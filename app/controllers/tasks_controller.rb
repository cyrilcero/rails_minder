class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update]

  def show
    redirect_to category_path(@category)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category)
      flash[:notice] = 'Task created successfully.'
    else
      render :new, status: 422
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, status: :see_other
      flash[:notice] = 'Task updated successfully.'
    else
      flash[:alert] = 'Failed to edit the task. Please try again.'
      render :edit, status: 422
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path, status: :see_other
    flash[:notice] = 'Task deleted successfully.'
  end

  private

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_task
      @task = @task = Task.find(params[:id])
    end


    def task_params
      params.require(:task).permit(:name, :description, :completed, :target_completion_date)
    end
end
