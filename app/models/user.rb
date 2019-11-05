class User < ApplicationRecord
  
   has_secure_password
   has_many :tasks, :dependent => :destroy
   validates :email, presence: true, uniqueness: true
has_many :labels

   def self.admin
      @users = User.all
      @admin = 0
      @users.each do |user|
        if user.title == "admin"
          @admin += 1
        end
      end
      return @admin
    end
end


