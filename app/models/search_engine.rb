class SearchEngine

  attr_reader :song, :album, :artist
  
  def initialize(params)
  	params ||= {}
    @song = params[:song]
	@artist = params[:artist]
	@album = params[:album]
	    puts "IN SEARCH params = "#{@params.inspect}"

  end
  
  def song_search()
    puts "IN SONG SEARCH artist = "#{@artist}"
    s = Song
    s = s.where('songs.name like ?', "#{@song}%") if @song.present?      
=begin   
    used if not using like
    s = s.where(name: @song) if @song.present?
    s = s.includes(:album).where(albums: { name: @album }) if @album.present?
    s = s.joins(:artist).includes(:artist).where(artists: { name: @artist }) if @artist.present?
=end
    s = s.includes(:album).where('albums.name like ?', "#{@album}%" ).references(:albums) if @album.present?
    s = s.joins(:artist).includes(:artist).where('artists.name like ?', "#{@artist}%").references(:artist) if @artist.present?
    
    s.kind_of?(ActiveRecord::Relation)  ?   s.sorted   : nil

  end
end
