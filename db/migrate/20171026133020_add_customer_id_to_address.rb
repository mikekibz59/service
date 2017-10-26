class AddCustomerIdToAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :customers, foreign_key: true
  end
end
