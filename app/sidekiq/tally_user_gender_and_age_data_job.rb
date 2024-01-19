# frozen_string_literal: true

class TallyUserGenderAndAgeDataJob
  include Sidekiq::Job

  def perform(*args)
    male_count = $redis.get("male_count").to_i
    female_count = $redis.get("female_count").to_i

    DailyRecord.create_or_find_by(created_at: Date.today).update!(
      male_count:,
      female_count:
    )
  end
end
