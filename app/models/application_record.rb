class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.impressionist_counter_caching?
  	false
  end
end
