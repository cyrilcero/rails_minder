class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @current_user = current_user
    @categories = current_user.categories.all
    @due_date_today = Task.where(category_id: @categories.pluck(:id), target_completion_date: Date.today)
  end

  def show
    @tasks = @category.tasks
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = current_user.categories.create(category_params)

    if @category.save
      flash[:notice] = "Category successfully added!"
      redirect_to root_path
    else
      flash[:alert] = "Oops, there was a problem adding a category. Please try again."
      render :new, status: 422
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated.", status: :see_other
    else
      flash[:alert] = "Oops, there was a problem editing the category. Please try again."
      render :edit, status: 422
    end
  end

  # DELETE /categories/1
  def destroy
    if @category.destroy
      flash[:alert] = "Category permanently deleted."
      redirect_to categories_path, status: :see_other
    else
      flash[:alert] = "Oops, there was a problem deleting the category. Please try again."
      render :index, status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
