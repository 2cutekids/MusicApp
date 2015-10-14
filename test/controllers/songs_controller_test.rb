require 'test_helper'

class SongsControllerTest < ActionController::TestCase

 test "should get index no parameters" do
    get :index
    assert_response :success
    assert_nil assigns(:songs)
  end
 test "should get songs with album parameters" do
     params = {}
     params[:search] = {}
     get :index, {search: {album: 'Best of Anny'} }
    assert_response :success
    assert_not_nil assigns(:songs)
    assert_equal(assigns(:songs).size, 1)
  end
  test "should get index and songs with artist parameters" do
     params = {}
     params[:search] = {}
     get :index, {search: {artist: 'Anny Safier'} }
     assert_response :success
     assert_not_nil assigns(:songs)
     assert_equal(assigns(:songs).size, 1)        
  end
  test "should get index and songs with song parameters" do
     params = {}
     params[:search] = {}
     get :index, {search: {song: 'Warrior'} }
     assert_response :success
     assert_not_nil assigns(:songs)
     assert_equal(assigns(:songs).size, 1)
  end    
    test "should get index and no songs due to invalid criteria" do
     params = {}
     params[:search] = {}
        get :index, {search: {song: 'Memories'} }
     assert_response :success
     assert_not_nil assigns(:songs)
     assert_empty(assigns(:songs))
  end    
=begin  Not Used 
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post :create, song: { name: @song.name }
    end

    assert_redirected_to song_path(assigns(:song))
  end

  test "should show song" do
    get :show, id: @song
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song
    assert_response :success
  end

  test "should update song" do
    patch :update, id: @song, song: { name: @song.name }
    assert_redirected_to song_path(assigns(:song))
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete :destroy, id: @song
    end

    assert_redirected_to songs_path
  end
=end    
end
