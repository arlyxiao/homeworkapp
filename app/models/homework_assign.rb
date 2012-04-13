class HomeworkAssign < ActiveRecord::Base
  # --- 模型关联
  belongs_to :homework, :class_name => 'Homework'
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  
  # --- 校验方法
  #validates :student, :presence => true
  
  
  
  # --- 给其他类扩展的方法
  module UserMethods
    def self.included(base)
      
      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
      # nothing ...
    end
  end
end
