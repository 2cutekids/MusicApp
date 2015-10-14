require 'test_helper'

class SearchEngineTest < ActiveSupport::TestCase
    test "No Valid Inputs For Search" do
        search = SearchEngine.new({})
        songs = search.song_search()
        assert_nil(songs)
    end
    test "No Valid Criteria For Search" do
        search = SearchEngine.new({artist: 'Z Z top'})
        songs = search.song_search()
        assert_empty(songs)
    end
    
    test "Search by Artist" do
        search = SearchEngine.new(artist: 'Anny Safier')
        songs = search.song_search()
        assert_equal(songs.size, 1)
        
    end
    
    test "Search by Artist partial name" do
        search = SearchEngine.new(artist: 'A')
        songs = search.song_search()
        assert_equal(songs.size, 1)
        
    end
    test "Search by Album" do
        search = SearchEngine.new(album: 'Best Of Anny')
        songs = search.song_search()
        assert_equal(songs.size, 1)
        
    end
    
    test "Search by Album partial name" do
        search = SearchEngine.new(album: 'Best')
        songs = search.song_search()
        assert_equal(songs.size, 2)
        
    end
    test "Search by Album partial name Artist" do
        search = SearchEngine.new(album: 'Best', artist: 'Anny Safier')
        songs = search.song_search()
        assert_equal(songs.size, 1)
        
    end
    test "Search by Song" do
        search = SearchEngine.new(song: 'Warrior')
        songs = search.song_search()
        assert_equal(songs.size, 1)
        
    end
    
    test "Search by Song partial name" do
        search = SearchEngine.new(song: 'War')
        songs = search.song_search()
        assert_equal(songs.size, 1)
        
    end
    
end