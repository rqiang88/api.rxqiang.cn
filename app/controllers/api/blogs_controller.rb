class Api::BlogsController < Api::ApplicationController
	def index
		@blogs = Blog.passed.page(params[:page])
	end

	def search
	end

	def show
	end

	private

	def set_blog
		@blog = Blog.find params[:id]
	end

end
