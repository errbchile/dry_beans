# frozen_string_literal: true

class AddPathIdToDeliveries < ActiveRecord::Migration[7.1]
  def change
    add_reference :deliveries, :path, null: false, foreign_key: true
  end
end
