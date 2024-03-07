require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)
    @category = categories(:categ_one)
    login
  end

  test "visiting the dashboard" do
    visit root_path
    assert_text "Hello"
  end

  test "should create category" do
    visit categories_url
    click_on "Create category"

    fill_in "Name", with: "Testing Category"
    click_on "Create Category"

    assert_text "Category created successfully!"
    click_on "Testing Category"
    assert_text "Testing Category"

  end

  test "should update Category" do
    visit category_url(@category)

    find("a[href='#{edit_category_path(@category)}']").click

    fill_in "Name", with: "#{@category.name}_edited"
    click_on "Update Category"

    assert_text "Category updated successfully."
  end

  test "should destroy Category" do
    visit category_url(@category)

    del_btn = find("[data-turbo-confirm='Delete #{@category.name} category?']")

    accept_alert do
      del_btn.click
    end

    assert_text "Category deleted permanently."
  end

  private

  def login
    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "111111"
    click_on "Login"

    assert_text "Logout"
  end
end
