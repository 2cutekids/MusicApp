class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, :through => :albums
  scope :sorted, lambda { order("artist.name ASC") }
  validates :name, uniqueness: true
  validates :name, presence: true
end
