class Work < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  has_many :work_tables, dependent: :destroy
  has_many :users, through: :work_tables

end
