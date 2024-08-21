class Task < ApplicationRecord
  belongs_to :client
  belongs_to :taskman

  validates :description, presence: true
  validates :position, presence: true
  validates :destination, presence: true
end
