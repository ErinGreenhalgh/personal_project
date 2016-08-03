class LinkedinService

  def initialize(oauth_token)
    @_connection = Faraday.new("https://api.linkedin.com")
    @_connection.headers["Authorization"] = "Bearer #{oauth_token}"
  end

  def get_profile_information(profile_field="summary", format="json")
    response = _connection.get("/v1/people/~:(#{profile_field})?format=#{format}")
    JSON.parse(response.body)
  end

  private
  def _connection
    @_connection
  end
end
