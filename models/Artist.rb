require('pg')
require_relative('./Album.rb')
require_relative('../db/sql_runner.rb')


class Artist

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{ |album| Album.new(album)}
  end

  def save()
    sql = "INSERT INTO artists (
    name
    ) VALUES (
      $1
      ) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{ |artist| Artist.new(artist)}
  end

end