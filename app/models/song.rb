class Song < ActiveRecord::Base
  has_one :artist, :through => :album
  belongs_to :album
  validates :name, uniqueness: true
  validates :name, presence: true
  scope :sorted, lambda { order("songs.name ASC") }
  def albums_name
	self.album.name
  end
  
  def artists_name
	self.artist.name
  end

end
