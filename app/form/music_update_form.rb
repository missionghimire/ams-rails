class MusicUpdateForm
  include ActiveModel::Model

  attr_accessor :title, :album_name, :genre

  def initialize(params = {})
    super()
    @title = params[:title]
    @album_name = params[:album_name]
    @genre = params[:genre]
  end
end