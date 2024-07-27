class ArtistCreateForm
  include ActiveModel::Model

  attr_accessor :name, :dob, :gender, :address, :first_release_year, :no_of_albums_released
  validates :name, presence: true
  validates :dob, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :first_release_year, presence: true, numericality: {only_integer: true}
  validates :no_of_albums_released, presence: true, numericality: {only_integer: true}

  def initialize(params = {})
    super()
    @name = params[:name]
    @dob = params[:dob]
    @address = params[:address]
    @gender = params[:gender]
    @first_release_year = params[:first_release_year]
    @no_of_albums_released = params[:no_of_albums_released]
  end

end
