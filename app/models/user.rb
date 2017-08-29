class User < ApplicationRecord
  validates :username, uniqueness: true, length: { minimum: 3 }
  has_secure_password

  def full_name
    return "#{ full_name } #{ last_name }"
  end
end
