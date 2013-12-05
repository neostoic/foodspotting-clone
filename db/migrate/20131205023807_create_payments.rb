class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.datetime :paid_date

      t.timestamps
    end
  end
end
