class DashboardsController < ApplicationController
  def index
    @user_count = User.count
    @artist_count = Artist.count
    @music_count = Music.count
  end
end
