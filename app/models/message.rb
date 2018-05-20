class Message < ApplicationRecord
  validates :title, :description, presence: { message: ": ce champ doit être renseigné." }
  belongs_to :user 
  has_many :comments
end
