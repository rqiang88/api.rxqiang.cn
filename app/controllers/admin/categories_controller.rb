class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :set_page, only: [:index, :search]
  def index
    @categories = CategoryService.new(params).search
    @categories = @categories.page(params[:page]).per(@per_page)
  end

  def create
  	category = Category.new(category_params)
  	if category.save
  		response_success
  	else
  		response_error(category)
  	end
  end

  def search
    index 
    render 'index'
  end

  def all
    @categories = Category.all
  end

  def show
    render json: {
      status: 'success',
      data: {
        id: @category.id,
        name: @category.name
      }
    }
  end

  def update
    if @category.update(category_params)
      response_success
    else
      response_error(@category)
    end
  end

  def destroy
    if @category.destroy
      response_success 
    else
      response_error("删除失败,请稍后再试")
    end
  end

  private

  def set_category
  	@category = Category.find params[:id]
  end

  def category_params
  	params.permit(:name)
  end
end
