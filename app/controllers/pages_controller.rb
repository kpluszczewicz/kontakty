class PagesController < ApplicationController
  def home
    if signed_in?
      @feed_items = current_user.feed.paginate(:page => params[:page])
      redirect_to current_user 
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
