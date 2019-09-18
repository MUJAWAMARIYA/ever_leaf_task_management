class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :name, :content, :kind_of_task, presence: true
  
end
