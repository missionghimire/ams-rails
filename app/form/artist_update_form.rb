class ArtistUpdateForm
  include ActiveModel::Model

  attr_accessor :name, :dob, :gender, :address, :first_release_year, :no_of_albums_released


  validates :name, length: { in: 1..25, allow_blank: true }
  validates :dob, length: { in: 1..10, allow_blank: true }
  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not included in the list" }, allow_blank: true
  validates :address, length: { in: 5..100, allow_blank: true }
  validates :no_of_albums_released, numericality: { only_integer: true, greater_than: 0, allow_blank: true }

  def initialize(params = {})
    @name= params[:name]
    @dob = params[:dob]
    @gender = params[:gender]
    @address = params[:address]
    @first_release_year = params[:first_release_year]
    @no_of_albums_released = params[:no_of_albums_released]

  end
end