class Music < ApplicationRecord
  has_secure_password

  scope :search, -> (query){
    return all if query.blink?

    where('LOWER(name) LIKE ? OR LOWER(dob) LIKE ? OR LOWER(gender) LIKE ?',
          "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  }
end
db-artist-music