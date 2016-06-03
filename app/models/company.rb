class Company < ActiveRecord::Base

  has_many :admins, :class_name => "Admin", :foreign_key => "company_id", :dependent => :destroy
  has_many :jobs, :class_name => "Job", :foreign_key => "company_id", :dependent => :destroy

  validates :name, presence: true, uniqueness:{ scope: :city }
  validates :city, presence: true
  validates :state, presence: true
end
