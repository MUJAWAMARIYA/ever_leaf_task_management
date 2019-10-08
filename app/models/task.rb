class Task < ApplicationRecord
    validates :titles, :content, presence: true    
enum priority: [:low, :medium, :high]

 belongs_to :user, optional: true
 
def self.search(term)
    if term
        where("status or priority or end_date LIKE ?", "%# {term}%").page params[:page].per_page(3)
    else
        order(' id: :des')
    end
end
def self.order_list(sort_order)
    if sort_order == "end_date"
        order(end_date: :desc)
    elsif sort_order == "status"
        order(status: :desc)
        elsif sort_order == "priority"
            order(priority: :desc)
        else
            order(created_at: :desc)
        end
    end

paginates_per 3

end

