class CreatePaths < ActiveRecord::Migration[7.1]
  def change
    create_table :paths do |t|
      t.string :departure
      t.string :arrival

      t.timestamps
    end
  end
end
