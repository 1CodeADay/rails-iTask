class Taskman < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :clients, through: :tasks
end
