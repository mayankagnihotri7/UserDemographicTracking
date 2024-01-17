# frozen_string_literal: true

class CreateDailyRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_records, id: :uuid do |t|
      t.integer :male_count, default: 0
      t.integer :female_count, default: 0
      t.integer :male_avg_age, default: 0
      t.integer :female_avg_age, default: 0

      t.timestamps
    end
  end
end
