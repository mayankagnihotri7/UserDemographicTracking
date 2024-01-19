# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @daily_records = DailyRecord.all

    liquid_template = Liquid::Template.parse(
      File.read(Rails.root.join("app", "views", "users", "index.liquid"))
    )
    
    rendered_content = liquid_template.render(
      { 
        users: @users.map(&:attributes),
        daily_records: @daily_records.map(&:attributes),
        total_user_count: @users.count
      }.deep_stringify_keys
    )

    render inline: rendered_content
  end
end
