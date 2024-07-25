class ArtistCreateForm
  include ActiveModel::Model

  attr_accessor :name, :dob, :gender, :address, :first_release_year, :number_of_albums
  validates :name, presence: true
  validates :dob, presence: true
  validates :gender, presence: true
  validates :first_release_year, presence: true, numericality: {only_integer: true}
  validates :number_of_albums, presence: true, numericality: {only_integer: true}

  def initialize(params = {})
    super()
    @name = params[:name]
    @dob = params[:dob]
    @gender = params[:gender]
    @first_release_year = params[:first_release_year]
    @number_of_albums = params[:number_of_albums]
  end

end
