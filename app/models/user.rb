class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :items, dependent: :destroy
  has_many :work_tables, dependent: :destroy
  has_many :works, through: :work_tables

  has_many :contacks, dependent: :destroy
  has_many :contacktos, through: :contacks

  has_many :inverse_contacks, class_name: "Contack", foreign_key: "contack_id", dependent: :destroy

  mount_uploader :avatar, PhotoUploader

  def admin?
    self.role == "admin"
  end
end
