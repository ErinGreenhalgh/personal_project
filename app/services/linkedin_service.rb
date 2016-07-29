class LinkedinService

  def initialize
    @connection = Faraday.new("https://api.linkedin.com")
  end

  def get_profile_information(oauth_token, profile_field="summary", format="json")
    @connection.headers = {"Authorization" => "Bearer #{oauth_token}"}
    response = @connection.get("/v1/people/~:(#{profile_field})?format=#{format}")
    JSON.parse(response.body)
  end
end
