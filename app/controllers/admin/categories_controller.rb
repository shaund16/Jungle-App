class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => ENV["NAME"], :password => ENV["PASSWORD"]
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)

    if @category.save
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:category).permit(
      :name,
      :category_id
    )
  end
end
