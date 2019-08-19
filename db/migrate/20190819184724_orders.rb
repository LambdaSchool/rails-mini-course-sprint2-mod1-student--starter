class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :customer_id
      t.timestamps
    end
  end
end
