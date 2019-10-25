class Association < ActiveRecord::Base
    belongs_to :labels
    belongs_to :tasks
 
 end