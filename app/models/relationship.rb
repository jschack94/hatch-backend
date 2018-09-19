class Relationship < ApplicationRecord
  belongs_to :mentee, class_name: "User"
  belongs_to :mentor, class_name: "User"
  validates :mentee_id, presence: true
  validates :mentor_id, presence: true
end
