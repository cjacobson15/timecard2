class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.boolean :full_access
      t.integer :user_id
      t.integer :company_id

      t.timestamps

    end
  end
end
