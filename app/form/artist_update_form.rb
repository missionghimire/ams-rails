class ArtistUpdateForm
  include ActiveModel::Model

  attr_accessor :name, :dob, :gender, :address, :first_release_date, :number_of_albums


  validates :name, length: { in: 1..25, allow_blank: true }
  validates :dob, length: { in: 1..10, allow_blank: true }
  validates :gender, inclusion: { in: %w(male female) }
  validates :address, length: { in: 5..100, allow_blank: true }
  validates :first_release_date, presence: true, allow_blank: true
  validates :number_of_albums, numericality: { only_integer: true, greater_than: 0, allow_blank: true }

  def initialize(params = {})
    @name= params[:name]
    @dob = params[:dob]
    @gender = params[:gender]
    @address = params[:address]
    @first_release_date = params[:first_release_date]
    @number_of_albums = params[:number_of_albums]

  end
end