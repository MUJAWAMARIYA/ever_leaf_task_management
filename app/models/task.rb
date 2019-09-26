class Task < ApplicationRecord
    validates :name, :content, presence: true    
paginates_per 2
# belongs_to :user

end
