class CategoryService
	attr_accessor :options, :categories

  def initialize(options)
    @options = options
    @categories = Category.all
  end

  def search
  	self.private_methods(false).map {|method| send(method) if method.to_s.include?('_search') }
    @categories
  end

  private 

  def _search_by_name
  	if options[:name].present?
  		@categories = @categories.where("name like ?", "%#{options[:name]}%")
  	end
  end
end