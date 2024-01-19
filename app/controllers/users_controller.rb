# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

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

  def destroy
    user_to_destroy = User.find(params[:id])

    user_to_destroy.destroy!

    redirect_to users_path, notice: 'User deleted successfully'
  end
end
