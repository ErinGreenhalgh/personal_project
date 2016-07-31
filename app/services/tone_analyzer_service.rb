class ToneAnalyzerService
  # attr_reader :connection

  def initialze
  end

  def analyze_text(user)
    connection = Faraday.new("https://gateway.watsonplatform.net")
    connection.params = {version: "2016-05-19", text: "#{user.profile_summary.content}"}
    connection.headers = {"password"      => ENV["TONE_ANALYZER_PASSWORD"],
                          "username"      => ENV["TONE_ANALYZER_USERNAME"],
                          "Authorization" => "Basic #{ENV['TONE_ANALYZER_AUTHORIZATION']}"}
    response = connection.get("/tone-analyzer/api/v3/tone")
    JSON.parse(response.body)
  end

end
