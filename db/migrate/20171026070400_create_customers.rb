class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :fullname
      t.date :date_of_birth

      t.timestamps
    end
  end
end
