class Task < ApplicationRecord
  belongs_to :client
  belongs_to :taskman, optional: true

  validates :description, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
