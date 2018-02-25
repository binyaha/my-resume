class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :items, dependent: :destroy
  

  mount_uploader :avatar, PhotoUploader

  def admin?
    self.role == "admin"
  end
end
