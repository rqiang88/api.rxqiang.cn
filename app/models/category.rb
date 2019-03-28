# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  name       :string(255)      default(""), not null
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
