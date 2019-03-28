class Attachment < ApplicationRecord
  mount_uploader :att, AttUploader

  belongs_to :admin, optional: true
  belongs_to :source, polymorphic: true, optional: true
end
