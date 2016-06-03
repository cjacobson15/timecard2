class Job < ActiveRecord::Base

  validates :pay_rate, presence: true
  validates :title, presence: true
  validates :company_id, presence: true
  validates :admin_id, presence: true
  validates :user_id, presence: true

  has_many :shifts, :dependent => :destroy
  belongs_to :admin, :class_name => "Admin", :foreign_key => "admin_id"
  belongs_to :admin, :class_name => "Admin", :foreign_key => "admin_id"
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  belongs_to :user
end
