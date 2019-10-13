class Task < ApplicationRecord
    validates :titles, :content, presence: true    
enum priority: [:low, :medium, :high]

validate :start_date_cannot_be_later_than_end_date
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


private
def start_date_cannot_be_later_than_end_date
  if start_date> end_date
    errors.add(:task, "Can not be set when start date is greater than the end date and time")
  end

end
end

