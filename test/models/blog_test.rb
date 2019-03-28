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

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
