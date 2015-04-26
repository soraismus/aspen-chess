class StaticPagesController < ApplicationController
  def home
    @users = fellow_players
    if request.xhr?
      render json: {
          users: filter_user_attributes(@users),
          current_user: filter_user_attributes(current_user),
          pagination_html: nil,
          alert: flash
        }
    end
  end

  private

    def fellow_players(user = current_user)
      User.except(user)
    end

end
