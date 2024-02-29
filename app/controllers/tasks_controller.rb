class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update]

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category), notice: "Task was successfully created."
    else
      render :new, status: 422
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "Category was successfully updated.", status: :see_other
    else
      flash[:alert] = "Oops, there was a problem editing the category. Please try again."
      render :edit, status: 422
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path, status: :see_other
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
