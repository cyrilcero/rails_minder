class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = current_user.categories
    @due_date_today = current_user.tasks.where(target_completion_date: Date.today)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      flash[:notice] = "Category created successfully!"
      redirect_to root_path
    else
      flash[:alert] = "Problem adding a category. Please try again."
      render :new, status: 422
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category updated successfully.", status: :see_other
    else
      flash[:alert] = "Problem editing the category. Please try again."
      render :edit, status: 422
    end
  end

  # DELETE /categories/1
  def destroy
    if @category.destroy
      flash[:alert] = "Category deleted permanently."
      redirect_to categories_path, status: :see_other
    else
      flash[:alert] = "Problem deleting the category. Please try again."
      render :index, status: 422
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = current_user.categories.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Path invalid. Make sure your link is correct."
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
