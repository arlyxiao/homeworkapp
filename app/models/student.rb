class Student < ActiveRecord::Base
  # --- 模型关联
  belongs_to :user

  has_many :homework_assigns
  
  # 学生所有被分配作业
  has_many :homeworks, :through=>:homework_assigns
      
  # 学生未过期作业
  has_many :undeadline_student_homeworks, :through=>:homework_assigns, :source=>:homework, :conditions => ['homeworks.deadline > ?', Time.now] 

  # 学生已过期作业
  has_many :deadline_student_homeworks, :through=>:homework_assigns, :source=>:homework, :conditions => ['homeworks.deadline <= ?', Time.now]

  
  # --- 校验方法
  validates :real_name, :presence=>true
  validates :sid, :uniqueness => { :if => Proc.new { |student| !student.sid.blank? } }
  
  # --- 给其他类扩展的方法
  module UserMethods
    def self.included(base)
      base.has_one :student

      base.send(:include,InstanceMethod)
    end
    
    module InstanceMethod
      def is_student?
        !self.student.blank?
      end
    end
  end
  
  # ----------- 以下是方法扩充
  
  
end
