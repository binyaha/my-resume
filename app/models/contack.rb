class Contack < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :contackto, class_name: "User" , foreign_key: "contack_id"

end
