class MusicCreateForm
  include ActiveModel::Model

  attr_accessor :artist_id, :title, :album_name, :genre

  validates :artist_id, presence: true
  validates :title, presence: true
  validates :album_name, presence: true
  validates :genre, presence: true


  def initialize(params = {})
    super()
    @artist_id = params[:id]
    @title = params[:title]
    @album_name = params[:album_name]
    @genre = params[:genre]
  end
end