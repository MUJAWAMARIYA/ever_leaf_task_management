class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #  validates :name, :content, :kind_of_task,  :priority,:status, presence: true
  # paginates_per 1
end
