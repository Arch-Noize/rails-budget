class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to groups_path
    else
      render 'pages/home'
    end
  end
end
