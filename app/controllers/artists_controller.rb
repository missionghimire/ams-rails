class ArtistsController < ApplicationController
  # before_action :authenticate_user
  # require 'csv'

  def index
    @artists = Artist.page(params[:page]).per(10)
    render :index
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
    render :create, status: :created
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
    @artist.number_of_albums = form.number_of_albums unless form.number_of_albums.nil?

    return error_validation(@artist.errors) if @artist.invalid?
    @artist.save!
    render :update, status: :ok
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    render :destroy, status: :no_content
  end

  def show_songs
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    render :show_songs
  end
end

