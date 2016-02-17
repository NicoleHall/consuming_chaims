class ChaimsService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://my-chaims.herokuapp.com/api/v1")
  end

  def songs
    parse(connection.get("songs"))
  end

  def create_song(data)
    parse(connection.post("songs", data))
  end

  def update_song(id, data)
    parse(connection.patch("songs/#{id}",data))
  end

  def destroy_song(id)
    parse(connection.delete("songs/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
