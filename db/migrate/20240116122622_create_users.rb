# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :gender
      t.jsonb :name, default: {}
      t.jsonb :location, default: {}
      t.integer :age

      t.timestamps
    end
  end
end
