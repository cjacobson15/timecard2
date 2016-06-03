class ChangeColumnJobsPayRatetoFloat < ActiveRecord::Migration
  def change
    change_column :jobs, :pay_rate, :float
  end
end
