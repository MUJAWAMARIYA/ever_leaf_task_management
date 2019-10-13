class ApplicationController < ActionController::Base 
  protect_from_forgery with: :exception
  add_flash_types :danger, :info, :warning, :success
  
  include SessionsHelper
    def self.search(term, page)
        if term
          where('priority LIKE ?', "%#{term}%").order('id: :DESC')
        else
          # note: default is all, just sorted
          order('id DESC')
        end
      end  
      def current_user
        @current_user ||= User.where(id: session[:user_id]).first
end
helper_method :current_user

end
