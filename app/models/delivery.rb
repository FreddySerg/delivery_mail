class Delivery < ActiveRecord::Base
  validates_presence_of :subject, :body
  attr_accessible :subject, :body, :attachment, :status
  mount_uploader :attachment, AttachUploader

  # statuses
  STARTED = 0
  COMPLETED = 1
end