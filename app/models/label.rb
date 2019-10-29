class Label < ApplicationRecord
    validates_presence_of :name, :description
    #  has_many :tasks_labels
     has_many :tasks, through: :tasks_labels
    belongs_to :user

    has_many :tasks_labels, dependent: :destroy
  has_many :tasks, through: :tasks_labels
 

end
