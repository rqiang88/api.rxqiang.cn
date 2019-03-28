class Admin::BlogsController < Admin::ApplicationController
  before_action :set_blog, only: [:show, :update]
  before_action :set_page, only: [:index, :show]
  def index
    @blogs = BlogService.new(params).perform
                .page(params[:page]).per(@per_page)
  end

  def new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      render :show
    else
      response_error(@blog)
    end
  end

  def update
    if @blog.update(blog_params)
      response_success
    else
      response_error(@blog)
    end
  end

  def show
  end

  def search
    index
    render :index
  end

  private

  def set_blog
    @blog = Blog.find(params[:id] || params[:blog_id])
  end

  def blog_params
    params.permit(:category_id, :title, :content)
  end
end
