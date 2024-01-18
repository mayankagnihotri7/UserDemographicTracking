# frozen_string_literal: true

class HourlyFetchAndStoreRandomUsersJob
  include Sidekiq::Job

  def perform(*args)
    response = HTTParty.get("https://randomuser.me/api/?results=20&seed=#{SecureRandom.hex}")
    users_data = JSON.parse(response.body)["results"]

    users_data.each do |user_data|
      User.create_or_find_by(id: user_data["login"]["uuid"]).update!(
        age: user_data["dob"]["age"],
        gender: user_data["gender"],
        location: user_data["location"],
        name: {
          title: user_data["name"]["title"],
          first: user_data["name"]["first"],
          last: user_data["name"]["last"]
        }
      )
    end
    male_count = User.where(gender: "male").count
    female_count = User.where(gender: "female").count

    $redis.set("male_count", male_count)
    $redis.set("female_count", female_count)
  end
end
