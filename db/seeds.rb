# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
info = {
  "Kate Bush" => {
    "Hounds of Love" => [
      "Running Up That Hill (A Deal with God)",
      "Hounds of Love",
      "The Big Sky",
      "Mother Stands for Comfort",
      "Cloudbusting",
      "And Dream of Sheep",
      "Under Ice",
      "Waking the Witch",
      "Watching You Without Me",
      "Jig of Life",
      "Hello Earth",
      "The Morning Fog"
    ],
    "The Dreaming" => [
      "Sat in Your Lap",
      "There Goes a Tenner",
      "Pull Out the Pin",
      "Suspended in Gaffa",
      "Leave It Open",
      "The Dreaming",
      "Night of the Swallow",
      "All the Love",
      "Houdini",
      "Get Out of My House"
    ] 
  },
  "Nina Simone" => {
    "Pastel Blues" => [
      "Be My Husband",
      "Nobody Knows You When You're Down and Out",
      "End of the Line",
      "Trouble in Mind",
      "Tell Me More and More and Then Some",
      "Chilly Winds Don't Blow",
      "Ain't No Use",
      "Strange Fruit",
      "Sinnerman"
    ]
  }
}

info.each do |artist, albums|
  puts "Artist: #{artist}"
  artist = Artist.create(name: artist)
  albums.each do |album, songs|
    puts "Album: #{album}"
    album = Album.create(name: album, artist_id: artist.id)
    songs.each do |song|
      Song.create(name: song, album_id: album.id)
    end
  end
end

