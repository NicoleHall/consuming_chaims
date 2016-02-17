class Song
  def self.service
    ChaimsService.new
  end

  def self.all
    service.songs.map { |song| build_object(song) }
  end

  def self.find(id)
    song_data = service.song(id)
    build_object(song_data)
  end

  def self.create(params)
    build_object(service.create_song(params))
  end

  def self.update(id, params)
    build_object(service.update_song(id, params))
  end

  def self.destoy(id)
    build_object(service.destroy_song(id))
  end

  private
  def self.build_object(data)
    OpenStruct.new(data)
  end


end
