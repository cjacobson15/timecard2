class Admin < ActiveRecord::Base
  has_many :jobs, :class_name => "Job", :foreign_key => "admin_id", :dependent => :destroy
  has_many :jobs, :class_name => "Job", :foreign_key => "admin_id", :dependent => :destroy
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"

validates :user_id, presence: true
validates :company_id, presence: true



end
