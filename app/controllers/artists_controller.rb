class ArtistsController < ApplicationController
  # before_action :authenticate_user
  # require 'csv'

  def index
    @artists = Artist.page(params[:page]).per(10)
  end

  def create
    form = ArtistCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    @artist = Artist.new
    @artist.name = form.name
    @artist.dob = form.dob
    @artist.gender = form.gender
    @artist.address = form.address
    @artist.first_release_year = form.first_release_year
    @artist.no_of_albums_released = form.no_of_albums_released

    return error_validation(@artist.errors) if @artist.invalid?
    @artist.save!
  end

  def update
    form = ArtistUpdateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    @artist = Artist.find(params[:id])
    @artist.name = form.name unless form.name.nil?
    @artist.dob = form.dob unless form.dob.nil?
    @artist.gender = form.gender unless form.gender.nil?
    @artist.address = form.address unless form.address.nil?
    @artist.first_release_year = form.first_release_year unless form.first_release_year.nil?
    @artist.no_of_albums_released = form.no_of_albums_released unless form.no_of_albums_released.nil?

    return error_validation(@artist.errors) if @artist.invalid?
    @artist.save!
  end

  def delete
    @artist = Artist.find(params[:id])
    @artist.destroy
  end

  def show_songs
    @artist = Artist.find(params[:id])
    @songs = @artist.music
  end
end

