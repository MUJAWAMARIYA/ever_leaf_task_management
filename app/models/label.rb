class Label < ApplicationRecord
  belongs_to :user
   validates :name, :description, presence: true
  has_many :tasks, through: :tasks_labels
  has_many :tasks_labels, dependent: :destroy
end
