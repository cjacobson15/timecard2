class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.boolean :approval
      t.string :pay_rate
      t.string :title
      t.integer :company_id
      t.integer :admin_id
      t.integer :user_id

      t.timestamps

    end
  end
end
