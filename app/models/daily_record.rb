# frozen_string_literal: true

# == Schema Information
#
# Table name: daily_records
#
#  id             :uuid             not null, primary key
#  female_avg_age :integer          default(0)
#  female_count   :integer          default(0)
#  male_avg_age   :integer          default(0)
#  male_count     :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class DailyRecord < ApplicationRecord
  after_update :calculate_avgerage_ages, if: :saved_change_to_male_count? || :saved_change_to_female_count?

  private

  def calculate_avgerage_ages
    self.male_avg_age = User.where(gender: "male").average(:age).to_i
    self.male_avg_age = User.where(gender: "female").average(:age).to_i
  end
end
