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
end
