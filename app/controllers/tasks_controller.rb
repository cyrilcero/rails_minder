class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update]

  def show
    redirect_to category_path(@category)
  end

  def new
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category)
      flash[:notice] = 'Task created successfully.'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Failed to create the task. Please try again.'
    end
  end

  def update
    if @task.update(task_params)
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'Task updated successfully.'
    else
      flash[:alert] = 'Failed to edit the task. Please try again.'
      render :edit, status: 422
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = 'Task deleted successfully.'
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Path invalid. Make sure your link is correct."
    redirect_to root_path
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Path invalid. Make sure your link is correct."
    redirect_to root_path
  end


  def task_params
    params.require(:task).permit(:name, :description, :completed, :target_completion_date)
  end
end
