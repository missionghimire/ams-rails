class MusicsController < ApplicationController
  # before_action :authenticate_user, except: %i[create]




  def create
    @artist = Artist.find(params[:id])
    @songs = @artist.music

    form = MusicCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?
    @music = Music.new
    @music.artist_id= form.artist_id
    @music.title = form.title
    @music.album_name = form.album_name
    @music.genre = form.genre
    return error_validation(@music.errors) if @music.invalid?
    @music.save!
  end

  def update
    form = MusicUpdateForm.new(params)
    error_validation(form.errors) if form.invalid?

    @music = Music.find(params[:id])
    @music.title = form.title unless form.title.nil?
    @music.album_name = form.album_name unless form.album_name.nil?
    @music.genre = form.genre unless form.genre.nil?

    return error_validation(@music.errors) if @music.invalid?
    @music.save!
  end

  def delete
    @music = Music.find(params[:id])
    @music.destroy
  end
end
