class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :job_id
      t.float :total_pay
      t.boolean :approval
      t.float :reimbursements
      t.float :bonus
      t.float :hours_worked
      t.datetime :time_out
      t.datetime :time_in

      t.timestamps

    end
  end
end
