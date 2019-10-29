class Association < ActiveRecord::Base
    belongs_to :label
    belongs_to :task
 
 end