require('pry')
require_relative('./models/Album.rb')
require_relative('./models/Artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Gigi'
  })

artist1.save()

artist1.name = "Mimi"
artist1.update()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Forever',
  'genre' => 'K-Pop'
  })

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Never Again',
  'genre' => 'K-Pop'
  })

album3 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Always',
  'genre' => 'K-Pop'
  })

album1.save()
album2.save()
album3.save()

album2.genre = "Thrash Metal"
album2.update()

artists = Artist.all()
albums = Album.all()

binding.pry
nil
