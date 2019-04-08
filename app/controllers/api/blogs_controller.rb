class Api::BlogsController < Api::ApplicationController
	before_action :set_blog, only: [:show]
	def index
		@blogs = BlogService.new(params).perform
								.order(id: :desc)
                .page(params[:page]).per(@per_page)
	end

	def search
		index
		render :index
	end

	def show
	end

	private

	def set_blog
		@blog = Blog.find params[:id]
	end

end
