class Shift < ActiveRecord::Base
  validates :job_id, presence: true
  validates :time_in, presence: true
  # validates :time_out, numericality:{ greater_than: :time_in }

  belongs_to :job


end
