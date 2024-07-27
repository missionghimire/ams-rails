class Music < ApplicationRecord


  scope :search, -> (query){
    return all if query.blink?

    where('LOWER(name) LIKE ? OR LOWER(dob) LIKE ? OR LOWER(gender) LIKE ?',
          "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  }
end
