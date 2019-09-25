class Task < ApplicationRecord
    validates :name, :content, :kind_of_task,  :priority,:status, presence: true    
paginates_per 2
# belongs_to :user

end
