class Task < ApplicationRecord
    validates :titles, :content, presence: true    

# belongs_to :user

def self.search(term)
    if term
        where("status or priority or end_date LIKE ?", "%# {term}%")
    else
        order(' id asc')
    end
end
def self.order_list(sort_order)
    if sort_order == "end_date"
        order(end_date: :asc)
    elsif sort_order == "status"
        order(Status: :desc)
        elsif sort_order == "priority"
            order(Priority: :desc)
        else
            order(created_at: :desc)
        end
    end

paginates_per 77
end

