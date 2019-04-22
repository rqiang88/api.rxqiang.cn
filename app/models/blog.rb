# == Schema Information
#
# Table name: blogs
#
#  id             :bigint(8)        not null, primary key
#  user_id        :bigint(8)
#  category_id    :bigint(8)
#  title          :string(255)
#  aasm_state     :string(255)
#  content        :text(65535)
#  views_count    :integer          default(0)
#  comments_count :integer          default(0)
#  remark         :text(65535)
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Blog < ApplicationRecord
  include AASM
  
  belongs_to :user, optional: true 
  belongs_to :category

  delegate :name, to: :category, prefix: true, allow_nil: true

  validates :content, :title, presence: true
  cattr_accessor :rxq

  aasm do 
    state :pending, initial: true
    state :passed
    state :refused

    event :pass do
      transitions from: :pending, to: :passed 
    end

    event :refuse do
      transitions from: [:pending, :passed], to: :refused 
    end
  end
end
