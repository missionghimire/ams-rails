class User < ApplicationRecord
  has_secure_password

  scope :search, -> (query) {
    return all if query.blank?

    where('LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR LOWER(email) LIKE ?',
          "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  }
end
