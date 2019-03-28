# == Schema Information
#
# Table name: admins
#
#  id              :bigint(8)        not null, primary key
#  name            :string(255)      default(""), not null
#  mobile          :string(255)
#  email           :string(255)
#  token           :string(255)
#  password_digest :string(255)
#  avatar_data     :text(65535)
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Admin < ApplicationRecord
  has_secure_password
  has_secure_token
end
