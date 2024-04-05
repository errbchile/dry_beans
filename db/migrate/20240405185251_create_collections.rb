class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.string :client
      t.string :product

      t.timestamps
    end
  end
end
