class LinkedinService
  def get_profile_summary
    # response = Faraday.get("https://api.linkedin.com/v1/people/~:(summary)?format=json")


    connection = Faraday.new("https://api.linkedin.com")
    connection.headers = {"Authorization" => "Bearer AQUYWUPxIxJE-eTwk_4uYVCPx86rUr3xmcMQQ3OUJ0iT8SzAUvnm5VRiiB1wfZD26Iux1sauvEqc0KFAVyu0Kk8F4UBv6tm8wCt29I_Z95qX4cWRE5fMhPVna2F7YFOg7IlHn_4NOkG4qB0Cm3XmUU8OUjE_GzHCB6Fh6jBrQvwYZaBIG4I"}

    response = connection.get("/v1/people/~:(summary)?format=json")

    JSON.parse(response.body)
  end

end
