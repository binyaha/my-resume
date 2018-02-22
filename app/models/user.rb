class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # 加上驗證 name 不能重覆 (關鍵字提示: uniqueness)
  

  mount_uploader :avatar, PhotoUploader

  def admin?
    self.role == "admin"
  end
end
