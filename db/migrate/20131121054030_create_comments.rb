class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :dish, index: true
      t.references :user, index: true
      t.string :comment

      t.timestamps
    end
  end
end
