class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :client
      t.string :product

      t.timestamps
    end
  end
end
