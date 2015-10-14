class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist
  scope :sorted, lambda { order("albums.name ASC") }
  validates :name, uniqueness: true
  validates :name, presence: true
    
end
