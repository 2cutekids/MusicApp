require 'test_helper'

class SongTest < ActiveSupport::TestCase
    
    test "song name must not be empty" do
        song = Song.new
        assert song.invalid?
        assert song.errors[:name].any? 
        assert_equal ["can't be blank"], song.errors[:name]

    end
    
    test "Song is not valid without a unique name" do
        artist = artists(:anny)
        album = artist.albums.first
        song = Song.new(name: "Warrior", album_id: album.id)
        assert song.invalid?
        assert_equal ["has already been taken"], song.errors[:name]
    end
end
