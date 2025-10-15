class RootController < ApplicationController
  allow_unauthenticated_access only: [:index]

  def index
    if authenticated?
      if Current.user&.admin?
        redirect_to users_path
      else
        redirect_to home_path  
      end
    else
      redirect_to new_sessions_path
    end
  end
end