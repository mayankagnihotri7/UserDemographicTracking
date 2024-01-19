# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  age        :integer
#  gender     :string
#  location   :jsonb
#  name       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  scope :search_name_case_insensitive, ->(query) {
    where(
      "LOWER(name->>'last') LIKE LOWER(:query) OR LOWER(name->>'first') LIKE LOWER(:query)",
      query: "%#{query}"
    )
  }
end
