class SessionsController < ApplicationController

  def login_form
  end

  def logout_form
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      log_in(user)

      if request.xhr?
        render :json => {
            :alert           => flash,
            :users           => filter_user_attributes(fellow_players),
            :current_user    => filter_user_attributes(user),
            :pagination_html => nil
          }
      else
        redirect_to :root
      end

    else
      flash.now[:error] = 'Invalid email/password combination'
      if request.xhr?
        render :json => {
          :alert => flash,
          :users => [],
          :current_user => nil,
          :pagination_html => ''
        }
      else
        # The path incorrectly changes to '/sessions'.
        render 'login_form'
      end
    end
  end

  def destroy
    log_out
    if request.xhr?
      render :json => { :alert => flash }
    else
      redirect_to :root
    end
  end

end
