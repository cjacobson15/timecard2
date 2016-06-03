class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :state
      t.string :city
      t.string :name

      t.timestamps

    end
  end
end
