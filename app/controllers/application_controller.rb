class ApplicationController < ActionController::Base 
 
    def self.search(term, page)
        if term
          where('priority LIKE ?', "%#{term}%").order('id DESC')
        else
          # note: default is all, just sorted
          order('id DESC')
        end
      end  
end
