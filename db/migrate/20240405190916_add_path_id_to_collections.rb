# frozen_string_literal: true

class AddPathIdToCollections < ActiveRecord::Migration[7.1]
  def change
    add_reference :collections, :path, null: false, foreign_key: true
  end
end
