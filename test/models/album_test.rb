require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
     test "Album name must not be empty" do
        album = Album.new
        assert album.invalid?
        assert album.errors[:name].any? 
        assert_equal(["can't be blank"], album.errors[:name])

    end
    
    test "Album is not valid without a unique name" do
        artist = artists(:anny)
        album = Album.new(name: "Best Of Anny", artist_id: artist.id)
        assert album.invalid?
        assert_equal(["has already been taken"], album.errors[:name])
    end
end
