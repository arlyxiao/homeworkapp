class HomeworkAssign < ActiveRecord::Base
  # --- 模型关联
  belongs_to :homework, :class_name => 'Homework'
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  
  # --- 校验方法
  #validates :creator, :presence => true
  
  
  
  # --- 给其他类扩展的方法
  module UserMethods
    def self.included(base)
      # 学生所有被分配作业
      base.has_many :assigned_homeworks, :through => :homework_assigns, :source => :homework
      
      # 学生未过期作业
      base.has_many :undeadline_student_homeworks,:through=>:homework_assigns, :source=>:homework, :conditions => ['homeworks.deadline > ?', Time.now] 

      # 学生已过期作业
      base.has_many :deadline_student_homeworks,:through=>:homework_assigns, :source=>:homework, :conditions => ['homeworks.deadline <= ?', Time.now]

      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
      # nothing ...
    end
  end
end
