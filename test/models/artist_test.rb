require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
    test "Artists name must not be empty" do
        artist = Artist.new
        assert artist.invalid?
        assert artist.errors[:name].any? 
        assert_equal( ["can't be blank"], artist.errors[:name])

    end
    
    test "Artists is not valid without a unique name" do
        artist = Artist.new(name: "Anny Safier")
        assert artist.invalid?
        assert_equal(["has already been taken"], artist.errors[:name])
    end

end
