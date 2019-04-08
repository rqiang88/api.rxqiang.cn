class Api::CategoriesController < Api::ApplicationController
  def all
    @categories = Category.all
  end
end
