class Client < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :taskmen, through: :tasks
end
