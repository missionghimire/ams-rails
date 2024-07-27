class Artist < ApplicationRecord
  has_many :music
  scope :search, -> (query) {
    return all if query.blank?

    where('LOWER(name) LIKE ? OR LOWER(address) LIKE ?',
          "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  }
end
