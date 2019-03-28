class BlogService
  attr_accessor :options, :blogs

  def initialize(options)
    @options = options
    @blogs = Blog.all
  end

  def perform
    self.private_methods(false).map {|method| send(method) if method.to_s.include?('_search') }
    blogs
  end

  private

  def _search_by_category_id
    if options[:category_id].present?
      @blogs = @blogs.where(category_id: options[:category_id])
    end
  end

  def _search_by_title
    if options[:title].present?
      @blogs = @blogs.where("title like ?", "%#{options[:title]}%")
    end
  end
end