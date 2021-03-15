class Member < ApplicationRecord
  validates :name, :url, presence: true
end
