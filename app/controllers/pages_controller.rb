class PagesController < ApplicationController
  def terms
  end

  def welcome
  end

  def landing
    # retrieve all Bookmarks ordered by descending creation timestamp
    @countdowns = Countdown.order('created_at desc')
  end
end
